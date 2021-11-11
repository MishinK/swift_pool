import Foundation

class Deck: NSObject {
	static let allSpades	: [Card] = Value.allValues.map({Card(c:Color.Spade, v:$0)})
    static let allDiamonds	: [Card] = Value.allValues.map({Card(c:Color.Diamond, v:$0)})
    static let allHearts	: [Card] = Value.allValues.map({Card(c:Color.Heart, v:$0)})
    static let allClubs		: [Card] = Value.allValues.map({Card(c:Color.Club, v:$0)})
    static let allCards		: [Card] = allSpades + allDiamonds + allHearts + allClubs
}

extension Array {
    func mixing() -> [Element] {
        var selfArray = self
        var i = 0
        while i < selfArray.count {
            let idx = Int(arc4random_uniform(UInt32(selfArray.count)))
			if i != idx {
				selfArray.swapAt(i, idx)
			}
            i += 1
        }
        return selfArray
    }
}