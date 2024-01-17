import UIKit
import Foundation

var greeting = "Hello, playground"


func oracleFormattedURLString(date:Date) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MMM-yyyy"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    let dateString = dateFormatter.string(from: date).uppercased()
    print(dateString)
}


let dateString = "2025-02-08"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

//if let date = dateFormatter.date(from: dateString) {
//    print(date)
//    oracleFormattedURLString(date: date)
//} else {
//    print("Unable to convert the string to a date.")
//}


//oracleFormattedURLString(date: <#T##Date#>)


///////
///

func differenceBetweenDates(startDate: Date, endDate: Date) -> (years: Int, months: Int, days: Int) {
    let calendar = Calendar.current
    
    let dateComponents = calendar.dateComponents([.year, .month, .day], from: startDate, to: endDate)
    
    let years = dateComponents.year ?? 0
    let months = dateComponents.month ?? 0
    let days = dateComponents.day ?? 0
    
    return (years, months, days)
}

// Example usage:
//let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

if let startDate = dateFormatter.date(from: "2020-01-01"), let endDate = dateFormatter.date(from: "2024-01-10") {
    let difference = differenceBetweenDates(startDate: startDate, endDate: endDate)
    print("Years: \(difference.years), Months: \(difference.months), Days: \(difference.days)")
} else {
    print("Invalid date format")
}
