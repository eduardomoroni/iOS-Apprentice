import Foundation

import Quick
import Nimble

@testable import BullsEye

class PersonSpecs: QuickSpec {
  override func spec() {
    it ("should have name and score") {
      let name = "Eduardo"
      let score = Score(0)
      let person = Person(name: name, score: score)
      
      expect(person.name).to(equal(name))
      expect(person.score).to(equal(score))
    }
  }
}
