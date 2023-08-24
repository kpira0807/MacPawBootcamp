import Foundation
import Combine

protocol LossesInfoNavigationHandler {}

final class LossesInfoModel {
    
    private let navigationHandler: LossesInfoNavigationHandler
    
    let dayInfo: LossesEquipmentInfo
    let previousDayInfo: LossesEquipmentInfo
    let requestState = CurrentValueSubject<RequestState, Never>(.finished)
    let reloadInfoData = PassthroughSubject<Void, Never>()
    var lossesPersonnel = [LossesPersonnel]()
    
    init(
        dayInfo: LossesEquipmentInfo,
        previousDayInfo: LossesEquipmentInfo,
        navigationHandler: LossesInfoNavigationHandler
    ) {
        self.dayInfo = dayInfo
        self.previousDayInfo = previousDayInfo
        self.navigationHandler = navigationHandler
        
        fetchData()
    }
    
    private func fetchData() {
        let url = URLGitHub.lossesPersonnel
        let urls = URL(string: url)
        
        URLSession.shared.dataTask(with: urls!) { (data, response, error) in
            guard let data = data else { return }
            
            Task {
                do {
                    let decoder = JSONDecoder()
                    let lossesPersonnelInfo = try decoder.decode([LossesPersonnel].self, from: data)
                    DispatchQueue.main.async { [self] in
                        
                        self.lossesPersonnel.append(contentsOf: lossesPersonnelInfo)
                        reloadInfoData.send(())
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
