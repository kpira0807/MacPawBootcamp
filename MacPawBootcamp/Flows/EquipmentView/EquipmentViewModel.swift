import Foundation
import UIKit
import Combine

final class EquipmentViewModel {
    
    var requestState: AnyPublisher<RequestState, Never> {
        model.requestState.eraseToAnyPublisher()
    }
    
    var reloadEquipmentData: AnyPublisher<Void, Never> {
        _reloadEquipmentData.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    var cellViewModels: [EquipmentCellViewModel] = []
    
    private let model: EquipmentModel
    private let _reloadEquipmentData = PassthroughSubject<Void, Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    init(model: EquipmentModel) {
        self.model = model
        
        setupBindings()
    }
    
    private func setupBindings() {
        model.reloadEquipmentData.sink { [weak self] _ in
            guard let self = self else { return }
            
            self.buildCellViewModels()
            self._reloadEquipmentData.send(())
        }.store(in: &subscriptions)
    }
    
    private func buildCellViewModels() {
        cellViewModels = model.lossesEquipment.map { value in
            EquipmentCellViewModel(
                equipmentOryx: value.equipmentOryx,
                model: value.model,
                manufacturer: value.manufacturer,
                lossesTotal: value.lossesTotal)
        }
    }
    
}
