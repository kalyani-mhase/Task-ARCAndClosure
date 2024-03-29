import UIKit

var greeting = "Hello, playground"
class Person1 {
    let name: String
    init(name: String) {
        self.name = name
        print("init called for person1 class")

    }
    func displayName(){
        print("name is \(name)")
    }
    deinit{
        print("deinit called for person1 class")
    }

}
var obj1 : Person1?
var obj2 : Person1?


if (1 == 1){
    let obj = Person1(name: "Bipp")
  obj1 = obj
obj2 = obj
    obj.displayName()
}
obj1?.displayName()
obj1 = nil
obj2 = nil



class Person {
    let name: String
  weak var job : Job?
    init(name: String) {
        self.name = name
        print("init called for person class")

    }
    func displayName(){
        print("name is \(name)")
    }
    deinit{
        print("deinit called for person class")
    }

}
class  Job{
    let jobDescription:String
   weak var person : Person?//here weak keyword are used to avoid strong refence cycle
    init(_jobDescription:String){
        self.jobDescription = _jobDescription
        print("init called for job class")
    }
    deinit{
        print("deinit callled for job class")
    }
}
if (1 == 1)
{
    let person1 = Person(name: "Bipp")
    let jobObj = Job(_jobDescription: "Software developer")
    person1.job = jobObj
    jobObj.person = person1//here create a strong refernce cycle

}
class PersonP {
    let name: String
   var job : Job1?
    init(name: String) {
        self.name = name
        print("init called for person class")
    }
    func displayName(){
        print("name is \(name)")
    }
    deinit{
        print("deinit called for person class")
    }
}
class  Job1{
    let jobDescription: String
   unowned let person : PersonP
    init(person:PersonP,joDes : String) {
        self.person = person
        self.jobDescription = joDes
        print("job class is init")
    }
    deinit{
        print("deinit callled for job class")
    }
}
if (1 == 1)
{
  var person1 : PersonP?
   person1 = PersonP(name: "BIPP")
    person1?.job = Job1(person: person1!, joDes: "softeware")
}





////To avoid the strong refernce cycle weak keyword are used.
//
////weak : weak is used when object are independent are each other and it can be nil.
////unowned : unowned is used object are dependon each other it cann't be nil.


//Closures are self-contained blocks of functionality that can be passed around and used in your code
//Closures can capture and store references to any constants and variables from the context in which they’re defined
//Simple closure
var welcome = {
    print("Welcome to Bipp")
}
welcome()
//Acceptiong parameter in closure
var addition = { (no1 : Int,no2: Int) in
    print("addition of two \(no1) and \(no2) is \(no1+no2)")
}
addition(10,20)
//returnign from closure
var addition1 = { (no1 : Int,no2: Int) in
    print("addition of two \(no1) and \(no2) is \(no1+no2)")
}
// closure that accepts one parameter
var printStudent = { (no : Int) in
    print("Total number of student  is \(no)")
}
// closure call
printStudent(50)

//closure with return value
var getSquare = {(no:Int)->Int in
    let square = no*no
    return square
}
var n1 = 25
print("square of the  \(n1) is \(getSquare(n1)) ")


//closure as function parameter

func getAddition(closure:()->()){
    print("Getting addition")
    closure()
}
getAddition(closure: {
    addition(12, 21)
})
//
//Trailing closure: Trailing closure means passing closure as a function last parameter.
//
func getInfo1(message : String, infoClosure:()->()){
    print(message)
    infoClosure()
}

getInfo1(message: "Let's get information India") {
    print("India is a peninsula, bound by the Indian Ocean in the south, the Arabian Sea on the west and Bay of Bengal in the east. ")
}
print("\n")

print("without traling closure")

func getInfo(infoClosure:()->(),message : String ){
    print(message)
    infoClosure()
}
getInfo(infoClosure: {
    print("India is a peninsula, bound by the Indian Ocean in the south, the Arabian Sea on the west and Bay of Bengal in the east. ")
}, message: "Let's get information India")

//AutoClosure
class AwesomeType: CustomStringConvertible {
    init() {
        print("Initialize")
    }
    
    var description: String {
        return "Description of an awesome type"
    }
}
func awesomeAutoclosure(_ value: @autoclosure()-> Any) {
    print("Before")
    print(value())
    print("After")
}

func notSoAwesomeNonAutoclosure(_ value: Any) {
    print("Before")
    print(value)
    print("After")
}

print("Awesome autoclosure")
//awesomeAutoclosure(AwesomeType())
awesomeAutoclosure {
    AwesomeType()
}
// Awesome autoclosure
// Before
// Initialize
// Description of an awesome type
// After
print("\n")

print("Not so awesome no autoclosure")
notSoAwesomeNonAutoclosure(AwesomeType())
// Not so awesome no autoclosure
// Initialize
// Before
// Description of an awesome type
// After


//Escaping Closures
//A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
// define a function with automatic closure

func display(greet: @autoclosure () -> ()) {
 greet()
}

// pass closure without {}
display(greet: print("Hello World!"))

func display1(greet:() -> ()) {
 greet()
}

// pass closure without {}
display1(greet: {
    print("Hello kalyani")
})



//Why we use Trailing closure
//If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
// define a function with automatic closure
//An autoclosure is a closure that is automatically created to wrap an expression that’s being passed as an argument to a function.
//But the big advantage of the autoclosures is that they allow us to delay the expression evaluation because this expression only runs after the function calls the closure.
