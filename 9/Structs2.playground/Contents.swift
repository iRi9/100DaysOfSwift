struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    private var id : String
    var name : String
    lazy var familytree = FamilyTree()
    
    init(name:String, id :String) {
        self.name = name
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}


var ed = Person(name: "Goro",id: "123")
ed.familytree
ed.identify()

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let edsiren = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)
