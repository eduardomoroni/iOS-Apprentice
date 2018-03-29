import UIKit

protocol SecondViewControllerDelegate: class {
    func onValueChanged(_ newText: String)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    var labelText: String?
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = labelText {
            label.text = text
            textField.text = text
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let text = textField.text {
            delegate?.onValueChanged(text)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
