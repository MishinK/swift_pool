import Foundation

class Card: NSObject {
	var c: Color
    var v: Value

    init(c: Color, v: Value) {
		self.c = c
        self.v = v
        super.init()
    }

    override var description: String {
        return "(\(self.v.rawValue + 1), \(self.c))"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
		if let object = object as? Card {
			return (self == object)
		}
		return (false);
    }
}

func ==(first: Card, second: Card) -> Bool {
    return (first.v == second.v && first.c == second.c)
}