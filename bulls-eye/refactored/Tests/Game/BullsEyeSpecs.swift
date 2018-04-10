import Foundation

import Quick
import Nimble

@testable import BullsEye

class BullsEyeSpecs: QuickSpec {
  override func spec() {
    var bullsEye: BullsEye!
    
    beforeEach {
      bullsEye = BullsEye()
    }
    
    it ("conforms with Game protocol") {
      expect(bullsEye).to(beAKindOf(Game.self))
    }
    
    describe("Round") {
      it ("starts with 1") {
        expect(bullsEye.round).to(equal(1))
      }
    }
    
    describe("New round") {
      it ("increments the round") {
        bullsEye.newRound()
        bullsEye.newRound()
        
        expect(bullsEye.round).to(equal(3))
      }
      
      it ("changes target to a new number") {
        let firstTarget = bullsEye.target
        
        bullsEye.newRound()
        
        expect(firstTarget).notTo(equal(bullsEye.target))
      }
    }
    
    describe("Random number") {
      it ("is a number between 0 and 100") {
        expect(bullsEye.target).to(beGreaterThanOrEqualTo(0))
        expect(bullsEye.target).to(beLessThanOrEqualTo(100))
      }
    }
  }
}
