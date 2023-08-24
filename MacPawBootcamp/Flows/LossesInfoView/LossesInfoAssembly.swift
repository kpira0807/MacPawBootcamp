import Swinject
import UIKit

final class LossesInfoAssembly: Assembly {
    
    private let parent: NavigationNode
    
    init(_ parent: NavigationNode) {
        self.parent = parent
    }
    
    func assemble(container: Container) {
        container.register(LossesInfoControllerView.self) { (
            resolver,
            dayInfo: LossesEquipmentInfo,
            previousDayInfo: LossesEquipmentInfo,
            navigationHandler: LossesInfoNavigationHandler
        ) in
            let model = LossesInfoModel(dayInfo: dayInfo, previousDayInfo: previousDayInfo, navigationHandler: navigationHandler)
            let viewModel = LossesInfoViewModel(model: model)
            let controller = LossesInfoControllerView(viewModel: viewModel)
            
            return controller
        }.inObjectScope(.transient)
    }
    
}
