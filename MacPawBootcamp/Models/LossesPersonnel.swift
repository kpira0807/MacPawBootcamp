import Foundation

struct LossesPersonnel: Codable {
    
    let date: String
    let day: Int
    let personnel: Int
    let personnelInfo: String
    let pow: Int?
    
    enum CodingKeys: String, CodingKey{
        case date
        case day
        case personnel
        case personnelInfo = "personnel*"
        case pow = "POW"
    }
    
}
