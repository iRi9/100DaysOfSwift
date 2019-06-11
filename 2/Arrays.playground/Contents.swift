//ARRAYS
let array = ["jhon","paul","ringo"]
array[2]

//type annotation
let array1:[String] = ["Pablo","Marcow"]
array1[1]


//SETS = unorder array, no value are same
let arrColors = ["red","green","blue"]
let colors = Set(arrayLiteral: arrColors)
let colors2 = Set(arrayLiteral: "red", "green", "blue", "red")


//TUPLES = cant add/remove items, cant change type item,access by name/number position
var name = (first: "Taylor", last:"Swift")
name.first
name.last
name.first="baron"
name.self

//DICTIONARY
let weight = [
    "marcow" : 1,
    "pablow" : 0.5
]
weight["pablow"]
let height:[String:Double] = [
    "marcow" : 1.4,
    "pablow" : 1
]
height["pablow"]
height["jainab",default: 0]

//Collection = Array, Sets, Dictionary

//Empty Dictionary
var teams = [String:String]()
teams["Giri"] = "red"
teams["Giri"]

//Empty Array
var results = [Int]()
results = [10,1,5]


//Empty Sets
var words = Set<String>()
words = Set(arrayLiteral: "red","green","blue")


//ENUMS
enum Result {
    case success
    case failure
}

var result2 = Result.success

//Enum associated
enum Activity {
    case bored
    case running(destination:String)
    case talking(topic:String)
    case singing(volume:Int)
}

var me = Activity.running(destination: "Gasibu")
me = Activity.bored
me = Activity.talking(topic: "Swift")

//Enum raw values
enum Planet:Int {
    case earth = 1
    case mars
    case pluto
}

let ourPlanet = Planet(rawValue: 2)

