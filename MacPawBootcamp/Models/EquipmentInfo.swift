import Foundation

struct EquipmentInfo: Codable {
    
    let equipmentOryx: String
    let model: String
    let manufacturer: String
    let lossesTotal: Int
    let equipmentUA: String
    
    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model
        case manufacturer
        case lossesTotal = "losses_total"
        case equipmentUA = "equipment_ua"
    }
    
}
