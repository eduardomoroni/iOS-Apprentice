import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func navigateToNextView() {
        let secondView = SecondViewController(nibName: "SecondViewController", bundle: nil)
        
        secondView.delegate = self
        secondView.labelText = textField.text
        
        navigationController?.pushViewController(secondView, animated: true)
    }

}

extension FirstViewController: SecondViewControllerDelegate {
    func onValueChanged(_ newText: String) {
        textField.text = newText
    }
}
