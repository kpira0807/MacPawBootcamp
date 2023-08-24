import Foundation
import UIKit

final class EquipmentCellViewModel {
    
    let equipmentOryx: String
    let model: String
    let manufacturer: String
    let lossesTotal: Int
    
    init(
        equipmentOryx: String,
        model: String,
        manufacturer: String,
        lossesTotal: Int
    ) {
        self.equipmentOryx = equipmentOryx
        self.model = model
        self.manufacturer = manufacturer
        self.lossesTotal = lossesTotal
    }
    
    var image: UIImage {
        switch equipmentOryx {
        case "Tanks":
            return Asset.tanks.image
            
        case "Armoured Fighting Vehicles":
            return Asset.armouredFightingVehicles.image
            
        case "Armoured Personnel Carriers":
            return Asset.armouredPersonnelCarriers.image
            
        case "Mine-Resistant Ambush Protected":
            return Asset.mineResistantAmbushProtected.image
            
        case "Infantry Fighting Vehicles":
            return Asset.infantryFightingVehicles.image
            
        case "Infantry Mobility Vehicles":
            return Asset.infantryMobilityVehicles.image
            
        case "Command Posts And Communications Stations":
            return Asset.commandPosts.image
            
        case "Engineering Vehicles And Equipment":
            return Asset.engineeringVehicles.image
            
        case "Self-Propelled Anti-Tank Missile Systems":
            return Asset.selfPropelledAntiTank.image
            
        case "Artillery Support Vehicles And Equipment":
            return Asset.artillerySupporVehicles.image
            
        case "Towed Artillery":
            return Asset.towedArtillery.image
            
        case "Self-Propelled Artillery":
            return Asset.selfPropelledArtillery.image
            
        case "Multiple Rocket Launchers":
            return Asset.multipleRocketLaunchers.image
            
        case "Anti-Aircraft Guns":
            return Asset.antiAircraftGuns.image
            
        case "Self-Propelled Anti-Aircraft Guns":
            return Asset.selfPropelledAntiAircraftGuns.image
            
        case "Surface-To-Air Missile Systems":
            return Asset.surfaceToAirMissileSystems.image
            
        case "Radars":
            return Asset.radars.image
            
        case "Jammers And Deception Systems":
            return Asset.jammersAndDeceptionSystems.image
            
        case "Aircraft":
            return Asset.aircraft.image
            
        case "Helicopters":
            return Asset.helicopters.image
            
        case "Unmanned Combat Aerial Vehicles":
            return Asset.unmannedCombatAerialVehicles.image
            
        case "Reconnaissance Unmanned Aerial Vehicles":
            return Asset.reconnaissanceUnmannedAerialVehicle.image
            
        case "Naval Ships":
            return Asset.navalShips.image
            
        case "Trucks, Vehicles and Jeeps":
            return Asset.trucksVehiclesAndJeeps.image
            
        default:
            return Asset.noImage.image
        }
    }
    
}
