import Foundation
import UIKit
import Combine

final class DaysViewModel {
    
    var requestState: AnyPublisher<RequestState, Never> {
        model.requestState.eraseToAnyPublisher()
    }
    
    var reloadDaysData: AnyPublisher<Void, Never> {
        _reloadDaysData.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    var cellViewModels: [DaysCellViewModel] = []
    
    private let model: DaysModel
    private let _reloadDaysData = PassthroughSubject<Void, Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    init(model: DaysModel) {
        self.model = model
        
        setupBindings()
    }
    
    private func setupBindings() {
        model.reloadDaysData.sink { [weak self] _ in
            guard let self = self else { return }
            
            self.buildCellViewModels()
            self._reloadDaysData.send(())
        }.store(in: &subscriptions)
    }
    
    private func buildCellViewModels() {
        cellViewModels = model.lossesEquipment.map { value in
            DaysCellViewModel(
                day: "\(value.day)",
                date: ConvertFormat().convertDateFormat(sourceDateString: value.date, sourceDateFormat: "yyyy-MM-dd", destinationFormat: "dd MM yyyy"),
                onSelect: { [weak self] in
                    let previousDay = value.day - 1
                    
                    if previousDay > 0 {
                        let previousDayInfo = self?.model.lossesEquipment.first(where: {$0.day == previousDay })
                        self?.model.showDayInfo(dayInfo: value, previousDayInfo: previousDayInfo ?? value)
                    } else {
                        self?.model.showDayInfo(dayInfo: value, previousDayInfo: value)
                    }
                })
        }
    }
    
}
