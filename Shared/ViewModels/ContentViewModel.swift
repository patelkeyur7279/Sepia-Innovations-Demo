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
                
            } catch {
                print("error: \(error)")
            }
        }
        
        let now = Date()
        
        let startTime = now.dateAt(hours: 9, minutes: 0)
        let endTime = now.dateAt(hours: 18, minutes: 00)
        
        let weekday = now.getTodayWeekDay()
        
        isTimeOut = (now >= startTime &&
                     now <= endTime)
        
        getPets()
    }
    
    func getPets() {
        
        if isTimeOut {
            
            
            
        }
        
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
        
        return isValidWorkingDay
    }
    
}
