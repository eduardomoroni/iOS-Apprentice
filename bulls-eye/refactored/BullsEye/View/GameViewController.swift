import Foundation
import UIKit

protocol GameViewController: class {
  weak var presenter: GamePresenter? { get set }
  func updateScoreLabel(_ label: String)
}

class BullsEyeViewController: UIViewController, GameViewController {
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  weak var presenter: GamePresenter?

  @IBAction func hitMeTapped() {
    
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    
  }
  
  @IBAction func startNewGame() {
    
  }
  
  func updateScoreLabel(_ label: String) {
    
  }
}
