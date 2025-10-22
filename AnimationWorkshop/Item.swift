//
//  Item.swift
//  AnimationWorkshop
//
//  Created by Carolina Silva dos Santos on 22/10/25.
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
