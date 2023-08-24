import Foundation
import Combine

protocol DaysNavigationHandler {
    
    func daysModelDidRequestToPresentInfo(
        _ model: DaysModel,
        dayInfo: LossesEquipmentInfo,
        previousDayInfo: LossesEquipmentInfo
    )
    
}

final class DaysModel {
    
    private let navigationHandler: DaysNavigationHandler
    
    let requestState = CurrentValueSubject<RequestState, Never>(.finished)
    let reloadDaysData = PassthroughSubject<Void, Never>()
    var lossesEquipment = [LossesEquipmentInfo]()
    
    init(navigationHandler: DaysNavigationHandler) {
        self.navigationHandler = navigationHandler
        
        fetchData()
    }
    
    func showDayInfo(dayInfo: LossesEquipmentInfo, previousDayInfo: LossesEquipmentInfo) {
        navigationHandler.daysModelDidRequestToPresentInfo(self, dayInfo: dayInfo, previousDayInfo: previousDayInfo)
    }
    
    private func fetchData() {
        let url = URLGitHub.lossesEquipment
        let urls = URL(string: url)
        
        URLSession.shared.dataTask(with: urls!) { (data, response, error) in
            guard let data = data else { return }
            
            Task {
                do {
                    let decoder = JSONDecoder()
                    let lossesEquipmentInfo = try decoder.decode([LossesEquipmentInfo].self, from: data)
                    DispatchQueue.main.async { [self] in
                        
                        self.lossesEquipment.append(contentsOf: lossesEquipmentInfo)
                        reloadDaysData.send(())
                        requestState.send(.finished)
                    }
                } catch {
                    self.requestState.send(.failed(error))
                    print("Error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
}
