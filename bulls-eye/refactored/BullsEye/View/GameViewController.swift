import Foundation
import UIKit

protocol GameViewController: class {
  weak var presenter: GamePresenter? { get set }
  func updateScoreLabel(_ label: String)
  func hitMeTapped()
  func startNewGame()
  func sliderMoved(_ slider: UISlider)
}

class BullsEyeViewController: UIViewController, GameViewController {
  weak var presenter: GamePresenter?
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    startNewGame()
  }
  
  @IBAction func hitMeTapped() {
    
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    
  }
  
  @IBAction func startNewGame() {
    print("Let the party begins")
  }
  
  func updateScoreLabel(_ label: String) {
    
  }
  
  func loading(_ isLoading: Bool) {
    activityIndicator.isHidden = !isLoading
  }
}
