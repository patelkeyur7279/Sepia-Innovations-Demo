//
//  Config.swift
//  Sepia Innovations Demo
//
//  Created by Keyur Patel on 13/12/22.
//

import Foundation

struct Config: Codable {
    var settings: ConfigSetting
}

struct ConfigSetting: Codable {
    var workHours: String
}
