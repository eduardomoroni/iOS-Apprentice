import UIKit
import QuartzCore
import Alamofire

class ViewController: UIViewController {
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0

  let defaultSession = URLSession(configuration: .default)
  var dataTask: URLSessionDataTask?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Customize slider
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)
    
    let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
    let trackLeftResizable =
      trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
    let trackRightResizable =
      trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    // Start game
    startNewGame()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference
    
    let title: String
    if difference == 0 {
      title = "Perfect!"
      points += 100
    } else if difference < 5 {
      title = "You almost had it!"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "Pretty good!"
    } else {
      title = "Not even close..."
    }
    score += points

    let message = "You scored \(points) points"
    
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default,
                               handler: {action in
                                self.startNewRound()
    })
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startNewGame() {
    if score > 0 {
      saveScore(score)
    }

    score = 0
    round = 0
    startNewRound()
    
    let transition = CATransition()
    transition.type = kCATransitionFade
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name:
      kCAMediaTimingFunctionEaseOut)
    view.layer.add(transition, forKey: nil)
  }
  
  func startNewRound() {
    round += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
}

extension ViewController {
  var playerName: String? {
    return UserDefaults.standard.string(forKey: "name")
  }

  override func viewDidAppear(_ animated: Bool) {
    // Ask and save the player name
    askForName()
  }

  func askForName() {
    if playerName == nil {
      let alert = UIAlertController(title: "Welcome!", message: "What's your name?", preferredStyle: .alert)

      alert.addTextField { (textField) in
        textField.text = ""
      }

      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        if let name = alert?.textFields?[0].text, !name.isEmpty {
          UserDefaults.standard.set(name, forKey: "name")
        } else {
          self.askForName()
        }
      }))

      self.present(alert, animated: true, completion: nil)
    }
  }

  func saveScore(_ score: Int) {
    loading(true)

    let parameters: Parameters = ["name": playerName as Any,
                                  "score": "\(score)"]
    Alamofire.request("https://us-central1-capdev-score-api.cloudfunctions.net/api/scores/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).response { response in
      self.loading(false)
    }
  }

  func loading(_ isLoading: Bool) {
    activityIndicator.isHidden = !isLoading
  }
  
}
