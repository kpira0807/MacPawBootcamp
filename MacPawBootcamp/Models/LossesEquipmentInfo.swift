import Foundation

struct LossesEquipmentInfo: Codable {
    
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let apc: Int
    let fieldArtillery: Int?
    let mrl: Int?
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case drone
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
    
}
