//
//  Extenstions.swift
//  Sepia Innovations Demo
//
//  Created by Keyur Patel on 12/12/22.
//

import Foundation

// MARK: Date
extension Date
{
    
    func dateAt(hours: Int, minutes: Int) -> Date {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        var date_components = calendar.components([.year, .month, .day, .weekday], from: self)
        
        date_components.hour = hours
        date_components.minute = minutes
        date_components.second = 0
        
        let newDate = calendar.date(from: date_components)!
        return newDate
    }
    
    func getTodayWeekDay() -> String {
        let dateFormatter = DateFormatter()
        
        let weekdays = dateFormatter.veryShortWeekdaySymbols
        
        
        dateFormatter.dateFormat = "E"
        let weekDay = dateFormatter.string(from: Date())
        return weekDay
    }
    
}
