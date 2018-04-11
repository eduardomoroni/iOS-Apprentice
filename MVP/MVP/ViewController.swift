import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        //UIApplication.shared.keyWindow?.rootViewController = viewController()
        self.present(viewController(), animated: false)
    }
}

func viewController() -> UIViewController {
    return view
}
