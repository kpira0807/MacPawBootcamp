import UIKit
import Swinject

final class DaysCoordinator: NavigationNode {
    
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
        
        DaysAssembly(self).assemble(container: container)
        LossesInfoAssembly(self).assemble(container: container)
    }
    
    private func addHandlers() {
        // add Settings flow event handlers
    }
    
}

extension DaysCoordinator: Coordinator {
    
    func createFlow() -> UIViewController {
        let controller: DaysControllerView = container.autoresolve(argument: self as DaysNavigationHandler)
        rootViewController = controller
        let navigation = UINavigationController(rootViewController: controller)
        
        return navigation
    }
    
}

extension DaysCoordinator: DaysNavigationHandler {
    func daysModelDidRequestToPresentInfo(_ model: DaysModel, dayInfo: LossesEquipmentInfo, previousDayInfo: LossesEquipmentInfo) {
        let controller: LossesInfoControllerView = container.autoresolve(arguments: dayInfo, previousDayInfo, self as LossesInfoNavigationHandler)
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension DaysCoordinator: LossesInfoNavigationHandler {}
