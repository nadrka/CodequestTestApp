import UIKit

protocol FlowController {
    func startFlow()
}

final class MainFlowController: FlowController {
    
    private let rootViewController: UINavigationController
    private var postFlowController: FlowController?
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func startFlow() {
        postFlowController = PostFlowController(rootViewController: rootViewController)
        postFlowController?.startFlow()
    }
    
    
    
}
