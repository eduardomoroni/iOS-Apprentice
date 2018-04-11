import Foundation
import UIKit

protocol GameViewController: class {
  var presenter: GamePresenter? { get set }
  var currentValue: Int { get }

  func updateScoreLabel(_ label: String)
  func hitMeTapped()
  func startNewGame()
}

class BullsEyeViewController: UIViewController, GameViewController {
  var presenter: GamePresenter?
  var currentValue = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  override func viewDidLoad() {
    super.viewDidLoad()
    let presenter = BullsEyePresenter(view: self, game: BullsEye())
    self.presenter = presenter
    startNewGame()
  }

  @IBAction func hitMeTapped() {
    print("Hit me tapped \(currentValue)")
    presenter?.hit(currentValue)
  }

  @IBAction func startNewGame() {
    print("Let the party begins")
    presenter?.newGame()
  }

  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }

  func updateScoreLabel(_ label: String) {
    scoreLabel.text = String(label)
  }

  func loading(_ isLoading: Bool) {
    activityIndicator.isHidden = !isLoading
  }
}
