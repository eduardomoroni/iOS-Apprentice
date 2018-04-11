import Foundation
import UIKit


// TODO: Remover a dependencia entre esta classe e uma UIViewController
// uma maneira eh receber a funcao presente durante a criacao
class AlertController {
  let view: UIViewController
  
  init(view: UIViewController) {
    self.view = view
  }
  
  func popUp(alert: Alert, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
    let alert = UIAlertController(title: alert.title,
                                  message: alert.message,
                                  preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default,
                               handler: handler)
    
    alert.addAction(action)
    view.present(alert, animated: true, completion: nil)
  }
}
