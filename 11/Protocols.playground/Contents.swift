protocol Identifiable {
    var id : String {get set}
}

struct User:Identifiable {
    var id: String
}

func displayID(thing:Identifiable) {
    print("my id is \(thing.id)")
}

var me = User(id: "10")
displayID(thing: me)


protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

extension Int {
    func squared() -> Int {
        return self * self
    }
}

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number = 8
number.squared()
number.isEven


let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()


protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()
