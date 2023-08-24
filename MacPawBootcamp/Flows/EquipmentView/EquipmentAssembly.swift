import Swinject
import UIKit

final class EquipmentAssembly: Assembly {
    
    private let parent: NavigationNode
    
    init(_ parent: NavigationNode) {
        self.parent = parent
    }
    
    func assemble(container: Container) {
        container.register(EquipmentViewController.self) { (resolver, navigationHandler: EquipmentNavigationHandler) in
            let model = EquipmentModel(navigationHandler: navigationHandler)
            let viewModel = EquipmentViewModel(model: model)
            let controller = EquipmentViewController(viewModel: viewModel)
            
            return controller
        }.inObjectScope(.transient)
    }
    
}
