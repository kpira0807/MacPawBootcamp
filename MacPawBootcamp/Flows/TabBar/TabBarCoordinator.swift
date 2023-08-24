import UIKit
import Swinject

final class TabBarCoordinator: NavigationNode {
    
    private weak var tabBarController: UITabBarController?
    private var container: Container!
    
    override init(parent: NavigationNode?) {
        super.init(parent: parent)
        
        registerFlow()
        addHandlers()
    }
    
    private func registerFlow() {
        container = Container()
        
        TabBarAssembly(self).assemble(container: container)
    }
    
    private func addHandlers() {
        // add Settings flow event handlers
    }
    
}

extension TabBarCoordinator: Coordinator {
    
    func createFlow() -> UIViewController {
        let tabBarViewController = container.resolve(TabBarViewController.self)
        tabBarController = tabBarViewController
        
        let daysCoordinator = DaysCoordinator(parent: self)
        let daysViewController = daysCoordinator.createFlow()
        let daysTitle = L10n.Days.title
        let daysImage = UIImage(systemName: "calendar.circle")
        let daysSelectedImage = UIImage(systemName: "calendar.circle.fill")
        
        let daysTabBarItem = UITabBarItem(
            title: daysTitle,
            image: daysImage,
            selectedImage: daysSelectedImage
        )
        daysViewController.tabBarItem = daysTabBarItem
        
        let equipmentCoordinator = EquipmentCoordinator(parent: self)
        let equipmentViewController = equipmentCoordinator.createFlow()
        let equipmentTitle = L10n.LossesEquipment.Title.name
        let equipmentImage = UIImage(systemName: "tray.circle")
        let equipmentSelectedImage = UIImage(systemName: "tray.circle.fill")
        
        let equipmentTabBarItem = UITabBarItem(
            title: equipmentTitle,
            image: equipmentImage,
            selectedImage: equipmentSelectedImage
        )
        equipmentViewController.tabBarItem = equipmentTabBarItem
        
        tabBarController!.viewControllers = [
            daysViewController,
            equipmentViewController
        ]
        
        return tabBarController!
    }
    
}
