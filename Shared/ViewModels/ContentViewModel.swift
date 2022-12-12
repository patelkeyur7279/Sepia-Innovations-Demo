//
//  ContentViewModel.swift
//  Sepia Innovations Demo
//
//  Created by Keyur Patel on 12/12/22.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var pets = [Pet]()
    @Published var isTimeOut: Bool = true
    
    init() {
        checkWorkingHours()
    }

    private func checkWorkingHours() {
        
        let jsonData = readLocalJSONFile(forName: "config")
        if let data = jsonData {
            do {
                let decodedData = try JSONDecoder().decode(Config.self, from: data)
                
                let configSettingsData = decodedData.settings.workHours.split(separator: " ")
                let weekdays = configSettingsData[0].split(separator: "-")
                let start = configSettingsData[1].split(separator: ":")
                let end = configSettingsData[3].split(separator: ":")
                
                let now = Date()
                let startTime = now.dateAt(hours: Int(start[0]) ?? 9, minutes: Int(start[1]) ?? 0)
                let endTime = now.dateAt(hours: Int(end[0]) ?? 18, minutes: Int(end[1]) ?? 0)
                
                let isWorkingDay = workingDaysFilter(from: weekdays[0].description, to: weekdays[1].description)
                if isWorkingDay {
                    isTimeOut = !(now >= startTime &&
                                 now <= endTime)
                    
                }
                
            } catch {
                print("error: \(error)")
            }
        }
        
        getPets()
        
    }
    
    func getPets() {
        
        print("isTimeOut: \(isTimeOut)")
        
        if !isTimeOut {
            
            let jsonData = readLocalJSONFile(forName: "pets_list")
            if let data = jsonData {
                do {
                    let decodedData = try JSONDecoder().decode(PetsList.self, from: data)
                    pets = decodedData.pets
                } catch {
                    print("error: \(error)")
                }
            }
            
        }
        
    }
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    private func workingDaysFilter(from: String, to: String) -> Bool {
        var isValidWorkingDay: Bool = false
        let now = Date()
        let dateFormatter = DateFormatter()
        guard let weekdays = dateFormatter.veryShortWeekdaySymbols else { return false }
        dateFormatter.dateFormat = "E"
        let weekday = dateFormatter.string(from: now).first!
        let daysInString = weekdays.description
        if let match = daysInString.range(of: "\(from)(.*)\(to)", options: .regularExpression) {
            isValidWorkingDay = String(daysInString[match]).contains(weekday)
        }
        return isValidWorkingDay
    }
    
}
