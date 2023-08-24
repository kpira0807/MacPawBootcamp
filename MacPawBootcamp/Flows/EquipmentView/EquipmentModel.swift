import Foundation
import Combine

protocol EquipmentNavigationHandler {}

final class EquipmentModel {
    
    private let navigationHandler: EquipmentNavigationHandler
    
    let requestState = CurrentValueSubject<RequestState, Never>(.finished)
    let reloadEquipmentData = PassthroughSubject<Void, Never>()
    var lossesEquipment = [EquipmentInfo]()
    
    init(navigationHandler: EquipmentNavigationHandler) {
        self.navigationHandler = navigationHandler
        
        fetchData()
    }
    
    private func fetchData() {
        let url = URLGitHub.equipmentInfo
        let urls = URL(string: url)
        
        URLSession.shared.dataTask(with: urls!) { (data, response, error) in
            guard let data = data else { return }
            
            Task {
                do {
                    let decoder = JSONDecoder()
                    let lossesEquipmentInfo = try decoder.decode([EquipmentInfo].self, from: data)
                    DispatchQueue.main.async { [self] in
                        
                        self.lossesEquipment.append(contentsOf: lossesEquipmentInfo)
                        reloadEquipmentData.send(())
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
