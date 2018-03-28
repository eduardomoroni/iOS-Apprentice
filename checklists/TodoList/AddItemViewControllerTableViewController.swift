import UIKit

class AddItemViewControllerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath)
        -> IndexPath? {
            return nil
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated:true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated:true)
    }
}
