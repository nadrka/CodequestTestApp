import UIKit

final class PostFlowController: FlowController {
    
    private let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func startFlow() {
       showPostListScreen()
    }
    
    private func showPostListScreen() {
        let viewController = ViewController()
        rootViewController.viewControllers = [viewController]
    }
    
    
}
