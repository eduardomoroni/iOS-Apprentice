import UIKit

// MODEL
struct Person {
    let firstName: String
    let lastName: String
}

// PRESENTER
protocol GreetingViewPresenter: class {
    init(view: GreetingView, person: Person)
    func showGreeting()
}

class GreetingPresenter: GreetingViewPresenter {
    let view: GreetingView
    let person: Person

    required init(view: GreetingView, person: Person) {
        self.person = person
        self.view = view
        self.view.presenter = self
    }
    
    func showGreeting() {
        let greeting = "Hello \(person.firstName) \(person.lastName)"
        self.view.showGreeting(greeting)
    }
}

// VIEW
protocol GreetingView: class {
    weak var presenter: GreetingPresenter? { get set }
    func showGreeting(_ message: String)
}

class GreetingViewController : UIViewController, GreetingView {
    weak var presenter: GreetingPresenter?
    
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
        self.presenter?.showGreeting()
    }
    
    func showGreeting(_ message: String) {
        greetingLabel.text = message
    }
}


let model = Person(firstName: "Eduardo", lastName: "Moroni")
let view = GreetingViewController()
let presenter = GreetingPresenter(view: view, person: model)

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
