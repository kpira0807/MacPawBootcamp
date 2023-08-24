import Foundation
import UIKit

final class DaysCellViewModel {
    
    let day: String
    let date: String
    let onSelect: () -> Void
    
    init(
        day: String,
        date: String,
        onSelect: @escaping () -> Void
    ) {
        self.day = day
        self.date = date
        self.onSelect = onSelect
    }
    
}
