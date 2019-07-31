import PlaygroundSupport
import UIKit

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


// Consolidation

//#1
extension UIView {
    func bounceOut(duration: Double) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
            }, completion: nil)
    }
}

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0))
containerView.backgroundColor = UIColor.white

PlaygroundPage.current.liveView = containerView
let myView = UIView(frame: CGRect(x: 150, y: 250, width: 100, height: 100))
myView.backgroundColor = UIColor.red
containerView.addSubview(myView)

myView.bounceOut(duration: 2)

//#2
extension Int {
    func times(_ closure: ()->Void) {
        guard self > 0 else {
            return
        }
        
        for _ in 0 ..< self {
            closure()
        }
    }
}

5.times {
    print("Hai")
}

// extension 3: remove an item from an array
extension Array where Element: Comparable {
    mutating func remove(item: Element) {
        if let location = self.firstIndex(of: item) {
            self.remove(at: location)
        }
    }
}

var numbers = [1, 2, 3, 4, 5, 5]
numbers.remove(item: 3)
