import Foundation

protocol Game {
  var round: Int { get }
  var target: Int { get }
  
  func newRound()
}

class BullsEye: Game {
  var round = 1
  var target = 0
  
  init() {
    target = generateRandomNumber()
  }
  
  func newRound() {
    round += 1
    target = generateRandomNumber()
  }
  
  private func generateRandomNumber() -> Int {
    var randomTarget = target
    
    while randomTarget == target {
      randomTarget = 1 + Int(arc4random_uniform(100))
    }
    
    return randomTarget
  }
}
