import UIKit

class GreetingViewController : UIViewController {
    var showGreetingButton: UIButton! {
        didSet {
            showGreetingButton.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
            showGreetingButton.setTitle("Button", for: .normal)
            showGreetingButton.setTitleColor(.black, for: .normal)
            showGreetingButton.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
            self.view.addSubview(showGreetingButton)
        }
    }
    var greetingLabel: UILabel! {
        didSet {
            greetingLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
            greetingLabel.textColor = .black
            greetingLabel.text = "Whatever"
            self.view.addSubview(greetingLabel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showGreetingButton = UIButton()
        greetingLabel = UILabel()
        self.view.backgroundColor = .white
    }

    @objc func didTapButton(button: UIButton) {
        // Button tapped
    }
}

let view = GreetingViewController()

// Start App
UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(
            to: UnsafeMutablePointer<Int8>.self,
            capacity: Int(CommandLine.argc)),
    nil,
    NSStringFromClass(AppDelegate.self)
)
