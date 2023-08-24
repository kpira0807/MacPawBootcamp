import Foundation

class ConvertFormat {
    
    func convertDateFormat(sourceDateString : String, sourceDateFormat : String, destinationFormat : String) -> String{
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = sourceDateFormat;
        
        if let date = dateFormatter.date(from: sourceDateString){
            dateFormatter.dateFormat = destinationFormat;
            return dateFormatter.string(from: date)
        }else{
            return ""
        }
    }
    
}
