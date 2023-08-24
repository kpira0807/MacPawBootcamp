import Swinject
import UIKit

final class DaysAssembly: Assembly {
    
    private let parent: NavigationNode
    
    init(_ parent: NavigationNode) {
        self.parent = parent
    }
    
    func assemble(container: Container) {
        container.register(DaysControllerView.self) { (resolver, navigationHandler: DaysNavigationHandler) in
            let model = DaysModel(navigationHandler: navigationHandler)
            let viewModel = DaysViewModel(model: model)
            let controller = DaysControllerView(viewModel: viewModel)
            
            return controller
        }.inObjectScope(.transient)
    }
    
}
