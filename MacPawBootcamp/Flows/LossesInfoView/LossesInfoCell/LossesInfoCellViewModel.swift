import Foundation
import UIKit

final class LossesInfoCellViewModel {
    
    let name: String
    let dayNumber: String
    let fullNumber: String
    
    
    init(
        name: String,
        dayNumber: Int,
        fullNumber: Int
    ) {
        self.name = name
        self.fullNumber = "\(fullNumber)"
        
        if dayNumber == 0 {
            self.dayNumber = ""
        } else {
            self.dayNumber = "(+\(dayNumber))"
        }
    }
    
}
