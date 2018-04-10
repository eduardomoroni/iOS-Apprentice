import Foundation

import Quick
import Nimble

@testable import BullsEye

class PersonSpecs: QuickSpec {
  override func spec() {
    var person: Person!
    
    beforeEach {
      person = Person("Eduardo")
    }
    
    it ("conforms with Game protocol") {
      expect(bullsEye).to(beAKindOf(Game.self))
    }

  }
}

