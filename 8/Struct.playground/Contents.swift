//struct Sport {
//    var name:String //it's called stored property
//
//}
//var tennis = Sport(name: "Tennis")
//print(tennis.name)

struct Sport {
    var name: String
    var isOlymicSport : Bool
    
    var olympicStatus: String { // it's called computed property
        if isOlymicSport {
            return "\(name) is an Olympic sport"
        }else{
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chess Boxing", isOlymicSport: false)
print(chessBoxing.olympicStatus)

struct Progress {
    var task: String
    var amount: Int { //property observer
        willSet {
            print("will set new amount \(amount)")
        }
        didSet{
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progressLoading = Progress(task: "Loading data", amount: 0)
progressLoading.amount = 30
progressLoading.amount = 50
progressLoading.amount = 80
progressLoading.amount = 100


struct City {
    var population: Int
    
    func collectTaxes() -> Int { //called method
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Giri")
person.makeAnonymous()


let string = "Do or do not, there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())



var toys = ["woody"]
print(toys.count)
toys.append("duck")
toys.firstIndex(of: "duck")
print(toys.sorted())
toys.remove(at: 1)
print(toys)
