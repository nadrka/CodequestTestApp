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
        let postService = PostService()
        let viewModel = PostListViewModel(postService: postService)
        let viewController = PostTableViewController(viewModel: viewModel)
        rootViewController.viewControllers = [viewController]
    }
    
}
