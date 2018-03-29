import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var checkMarkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(_ item: ChecklistItem) {
        cellLabel.text = item.text
        
        if item.checked {
            checkMarkLabel.text = "✓"
        } else {
            checkMarkLabel.text = ""
        }
    }

}
