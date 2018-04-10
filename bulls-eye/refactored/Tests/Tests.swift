import XCTest
import Quick
import Nimble

@testable import BullsEye

class Tests: XCTestCase {
  
  var viewController: ViewController!
  
    override func setUp() {
        super.setUp()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        viewController.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
    }
  
    func testStartNewGame() {
      
    }
  
    func testExample() {
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
