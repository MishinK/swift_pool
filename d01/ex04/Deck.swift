import Foundation

class Deck: NSObject {
 	
	static let allSpades	: [Card] = Value.allValues.map({Card(c:Color.Spade, v:$0)})
    static let allDiamonds	: [Card] = Value.allValues.map({Card(c:Color.Diamond, v:$0)})
    static let allHearts	: [Card] = Value.allValues.map({Card(c:Color.Heart, v:$0)})
    static let allClubs		: [Card] = Value.allValues.map({Card(c:Color.Club, v:$0)})
    static let allCards		: [Card] = allSpades + allDiamonds + allHearts + allClubs
    
	var cards : [Card] = allCards
    var discards : [Card] = []
    var outs : [Card] = []

	init (mixed: Bool) {
        if (mixed) {
           self.cards = self.cards.mixing();
        }
    }

	override public var description: String {
		return (self.cards.description)
	}

	func draw() -> Card? {
        let first : Card? = self.cards.first
        self.outs.append(cards[0])
        self.cards.remove(at: 0)
        return first
    }

    func fold(c : Card) {
        var f: Bool = false
		var idx = 0;
        for elem in outs {
            if elem == c {
                f = true
				break 
            }
			idx += 1
        }
        if (f) {
            self.discards.append(c)
			self.outs.remove(at:idx)
        }
    }
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