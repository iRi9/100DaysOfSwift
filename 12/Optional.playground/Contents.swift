var age : Int? = nil
age = 12

var name: String? = nil

//Unwrapping optional
if let unwrapname = name {
    print("size name = \(unwrapname.count)")
}else{
    print("missing name!")
}


//Unwrapping with guard
func greet(_ name:String?) {
    guard let unwrapped = name else {
        print("You dont privide a name!")
        return
    }
    
    print("hello, \(unwrapped)")
}
greet("")


//Force unwrapping
let str = "3"
let myNum = Int(str)

//Implicitly unwrapped optionals
let ages : Int! = nil


//Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 212) ?? "Anonymous"


//Optional chaining
let names = ["Jhon","paul","george","ringgo"]
let beatle = names.first?.uppercased()


//Optional try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
try! checkPassword("sekrit")
print("OK!")

//Failable initializers
struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
let myUser = Person(id: "123456789")
print(myUser?.id)


//Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

