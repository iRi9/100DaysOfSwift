
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}

printHelp()

func square(number:Int) -> Int{
    return(number*number)
}

square(number: 4)

func anyGreetings(name:String) -> (String,String,String) {
    return ("hi \(name)","hola \(name)", "whats up \(name)")
}

anyGreetings(name: "baron")

func sayHello(to name:String){ //to used external and name use to internal function
    print("hello \(name)")
}

sayHello(to: "giri")


//OMITTING parameters
func greet(_ person:String) {
    print("hai \(person)")
}
greet("giri")

//DEFAULT value
func greets(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greets("baron",nicely: false)


//VARIADIC function
func squares(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
squares(numbers: 1,2,3)


//THROW error
enum PasswordError:Error {
    case obvious
}

func checkPassword(_ password:String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

//checkPassword("password") // this will throws an error

//Safe way to call func that have an error
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//INOUT function
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
print(myNum)
