//
//  Item.swift
//  AC-testapp
//
//  Created by Tyler Boston on 11/24/23.
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
