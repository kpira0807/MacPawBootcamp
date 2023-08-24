import UIKit
import Swinject

final class EquipmentCoordinator: NavigationNode {
    
    var navigationController: UINavigationController? {
        rootViewController.navigationController
    }
    
    private weak var rootViewController: UIViewController!
    private weak var viewController: UIViewController?
    private var container: Container!
    
    override init(parent: NavigationNode?) {
        super.init(parent: parent)
        
        registerFlow()
        addHandlers()
    }
    
    private func registerFlow() {
        container = Container()
        
        EquipmentAssembly(self).assemble(container: container)
    }
    
    private func addHandlers() {
        // add Settings flow event handlers
    }
    
}

extension EquipmentCoordinator: Coordinator {
    
    func createFlow() -> UIViewController {
        let controller: EquipmentViewController = container.autoresolve(argument: self as EquipmentNavigationHandler)
        rootViewController = controller
        let navigation = UINavigationController(rootViewController: controller)
        
        return navigation
    }
    
}

extension EquipmentCoordinator: EquipmentNavigationHandler {}
