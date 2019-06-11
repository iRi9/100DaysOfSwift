let driving = {
    print("I'm driving in my car")
}

driving()

let drive = {(place:String) in
    print("I'm goint to \(place) in my car")
}
drive("gasibu")

let drivingWithReturn = {(place:String) -> String in
    return "I'm going to \(place) in my car"
}

drivingWithReturn("bandung")


//CLOSURES AS PARAMETER
func travel(action: () -> Void) {
    action()
    print("I'm getting ready to go")
    
    print("I arrived")
}

travel(action: driving)

//TRAILING CLOSURES
travel() {
    print("I'm giri")
}
//OR
travel {
    print("I'm giri 2")
}


//closures as parameters when they accept parameters
func travel2(action:(String) -> String) {
    print("I'm getting ready to go")
    let description = action("LOndon")
    print(description)
    print("I arrived")
}
travel2 { (place:String) -> String in
    return "I'm going to \(place) in my car"
}
//SHORTHAND Parameter
travel2 { place -> String in
    return "I'm going to \(place) in my car"
}
travel2{ place in
    return "I'm going to \(place) in my car"
}
travel2 { place in
    "I'm going to \(place) in my car"
}
travel2 {
    "I'm going to \($0) in my car"
}


//MULTIPLE PARAMETER
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}


//let resignation = { (name: String) in
//    print("Dear \(name), I'm outta here!")
//}
//func printDocument(contents: (String) -> Void) {
//    print("Connecting to printer...")
//    print("Sending document...")
//    contents("baron")
//}
//printDocument(contents: resignation)


func holdClass(name: String, lesson: () -> Void) {
    print("Welcome to \(name)!")
    lesson()
    print("Make sure your homework is done by next week.")
}
holdClass(name:"Philosophy 101") {
    print("All we are is dust in the wind, dude.")
}
