import Foundation
import UIKit
import Combine

final class LossesInfoViewModel {
    
    var requestState: AnyPublisher<RequestState, Never> {
        model.requestState.eraseToAnyPublisher()
    }
    
    var reloadDayInfoData: AnyPublisher<Void, Never> {
        _reloadDayInfoData.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    var dayNumber: String {
        "Day \(model.dayInfo.day)"
    }
    
    var cellViewModels: [LossesInfoCellViewModel] = []
    
    private let model: LossesInfoModel
    private let _reloadDayInfoData = PassthroughSubject<Void, Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    init(model: LossesInfoModel) {
        self.model = model
        
        setupBindings()
    }
    
    private func setupBindings() {
        model.reloadInfoData.sink { [weak self] _ in
            guard let self = self else { return }
            
            self.buildCellViewModels()
            self._reloadDayInfoData.send(())
        }.store(in: &subscriptions)
    }
    
    private func buildCellViewModels() {
        let dayInfo = model.dayInfo
        let previousDayInfo = model.previousDayInfo
        
        let personnelDayInfo = model.lossesPersonnel.first(where: {$0.day == dayInfo.day})
        let personnelpreviousDayInfo = model.lossesPersonnel.first(where: {$0.day == previousDayInfo.day})
        
        createLossesInfo(
            name: L10n.Losses.Personnel.title,
            fullNumber: personnelDayInfo?.personnel ?? 0,
            dayNumber: ((personnelDayInfo?.personnel ?? 0) - (personnelpreviousDayInfo?.personnel ?? 0))
        )
        
        createLossesInfo(
            name: L10n.Losses.Aircrafts.title,
            fullNumber: dayInfo.aircraft,
            dayNumber: (dayInfo.aircraft - previousDayInfo.aircraft)
        )
        createLossesInfo(
            name: L10n.Losses.Helicopters.title,
            fullNumber: dayInfo.helicopter,
            dayNumber: (dayInfo.helicopter - previousDayInfo.helicopter)
        )
        createLossesInfo(
            name: L10n.Losses.Tanks.title,
            fullNumber: dayInfo.tank,
            dayNumber: (dayInfo.tank - previousDayInfo.tank)
        )
        createLossesInfo(
            name: L10n.Losses.Apc.title,
            fullNumber: dayInfo.apc,
            dayNumber: (dayInfo.apc - previousDayInfo.apc)
        )
        
        if let fieldArtillery = dayInfo.fieldArtillery {
            createLossesInfo(
                name: L10n.Losses.FieldArtilleries.title,
                fullNumber: fieldArtillery,
                dayNumber: (fieldArtillery - (previousDayInfo.fieldArtillery ?? 0))
            )
        }
        
        if let mrl = dayInfo.mrl {
            createLossesInfo(
                name: L10n.Losses.Mrl.title,
                fullNumber: mrl,
                dayNumber: (mrl - (previousDayInfo.mrl ?? 0))
            )
        }
        
        if let militaryAuto = dayInfo.militaryAuto {
            createLossesInfo(
                name: L10n.Losses.MilitaryAutos.title,
                fullNumber: militaryAuto,
                dayNumber: (militaryAuto - (previousDayInfo.militaryAuto ?? 0))
            )
        }
        
        if let fuelTank = dayInfo.fuelTank {
            createLossesInfo(
                name: L10n.Losses.FuelTanks.title,
                fullNumber: fuelTank,
                dayNumber: (fuelTank - (previousDayInfo.fuelTank ?? 0))
            )
        }
        
        if let drone = dayInfo.drone {
            createLossesInfo(
                name: L10n.Losses.Drones.title,
                fullNumber: drone,
                dayNumber: (drone - (previousDayInfo.drone ?? 0))
            )
        }
        
        if let navalShip = dayInfo.navalShip {
            createLossesInfo(
                name: L10n.Losses.Naval.title,
                fullNumber: navalShip,
                dayNumber: (navalShip - (previousDayInfo.navalShip ?? 0))
            )
        }
        
        if let antiAircraftWarfare = dayInfo.antiAircraftWarfare {
            createLossesInfo(
                name: L10n.Losses.Aaw.title,
                fullNumber: antiAircraftWarfare,
                dayNumber: (antiAircraftWarfare - (previousDayInfo.antiAircraftWarfare ?? 0))
            )
        }
        
        if let specialEquipment = dayInfo.specialEquipment {
            createLossesInfo(
                name: L10n.Losses.SpecialEquipment.title,
                fullNumber: specialEquipment,
                dayNumber: (specialEquipment - (previousDayInfo.specialEquipment ?? 0))
            )
        }
        
        if let vehiclesAndFuelTanks = dayInfo.vehiclesAndFuelTanks {
            createLossesInfo(
                name: L10n.Losses.Vft.title,
                fullNumber: vehiclesAndFuelTanks,
                dayNumber: (vehiclesAndFuelTanks - (previousDayInfo.vehiclesAndFuelTanks ?? 0))
            )
        }
        
        if let cruiseMissiles = dayInfo.cruiseMissiles {
            createLossesInfo(
                name: L10n.Losses.CruiseMissiles.title,
                fullNumber: cruiseMissiles,
                dayNumber: (cruiseMissiles - (previousDayInfo.cruiseMissiles ?? 0))
            )
        }
    }
    
    private func createLossesInfo(name: String, fullNumber: Int, dayNumber: Int) {
        let newInfo = LossesInfoCellViewModel(name: name, dayNumber: dayNumber, fullNumber: fullNumber)
        cellViewModels.append(newInfo)
    }
    
}
