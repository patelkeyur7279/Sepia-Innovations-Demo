//
//  Pet.swift
//  Sepia Innovations Demo
//
//  Created by Keyur Patel on 12/12/22.
//

import Foundation

struct Pet: Codable, Hashable {
    
    var image_url: String
    var title: String
    var content_url: String
    var date_added: String
    
    var addedDate: String {
        return formateDateFromStringInput(inputDate: date_added)
    }
    
    static func example() -> Pet {
        return Pet(image_url: "https://upload.wikimedia.org/wikipedia/commons/3/32/Ferret_2008.png",
                   title: "Ferret",
                   content_url: "https://en.wikipedia.org/wiki/Ferret",
                   date_added: "2018-06-23T19:14:04.027Z")
    }
    
    private func formateDateFromStringInput(inputDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: inputDate)
        dateFormatter.dateFormat = "MMM d, h:mm a"
        return dateFormatter.string(from: date ?? Date())
    }
    
}
