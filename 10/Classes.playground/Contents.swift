
//class Dog {
//    var name:String
//    var breed:String
//    init(name:String,breed:String) { //Different between class & sturct is in class you dont have memberwise initializer
//        self.name = name
//        self.breed = breed
//    }
//}
//
//let poppy = Dog(name: "poppy", breed: "Puddle")
//
//class Puddle:Dog{ //Different between class & sturct is in class you can inheritance
//    init(name:String) {
//        super.init(name: name, breed: "Puddle")
//    }
//}
//let myPuddle = Puddle(name: "Ketty")

//OVERIDING METHOD
//class Dog {
//    func makeNoise() {
//        print("woof!")
//    }
//}
//
//class Poddle: Dog {
//    override func makeNoise() {
//        print("yip!")
//    }
//}
//
//let pupy = Poddle()
//pupy.makeNoise()

//FINAL CLASSES
//final class Dog {
//    var name:String
//    var breed:String
//    init(name:String,breed:String) { //Different between class & sturct is in class you dont have memberwise initializer
//        self.name = name
//        self.breed = breed
//    }
//}
//
//class Poodle:Dog { //Make an error!
//}


//OBJECT COPY
/*
 the third different betweet struct & class is how they copy
 when copying stuct both original and copy is a different things
 but for class its pointing in same memory
 */
//class Singer {
//    var name = "Tylor Swift"
//}
//
//var singer = Singer()
//print(singer.name)
//
//var singerCopy = singer
//singerCopy.name = "bambang"
//print(singerCopy.name)
//print(singer.name)


//DEINITIALIZER
//class Person { //Class have a deinitializer struct not
//    var name = "jhon doe"
//
//    init() {
//        print("\(name) is alive!")
//    }
//
//    func printGreeting() {
//        print("Hello, I'm \(name)")
//    }
//
//    deinit {
//        print("\(name) is no more!")
//    }
//}
//
//for _ in 1...3 {
//    let person = Person()
//    person.printGreeting()
//}


//MUTABILITY
/*
if you have a constant class with a variable property, that property can be changed.
but struct is cannot
 */
 
class Singer { // change it to struct to know the different
    var name = "Taylor Swift"
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)
