
// Challenge

extension String {
    func withPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else {
            return "\(prefix+self)"
        }
        return self
    }
    
    func isNumeric() -> Bool {
        return Double(self) == nil ? false:true
    }
    
    func toArray() -> [Substring] {
        return self.split(separator: "\n")
    }
}
//#1
var strings = "pet"
strings.withPrefix("car")
//#2
var number = "234"
number.isNumeric()
//#3
var myText = "this\nis\na\ntes"
myText.toArray()




