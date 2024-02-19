//
//  Item.swift
//  Waste Wizard
//
//  Created by Eric Yang on 2024-02-19.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
