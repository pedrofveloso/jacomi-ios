//
//  Order.swift
//  jacomi-ios
//
//  Created by Pedro Veloso on 24/10/24.
//

import Foundation
import SwiftData

@Model
final class Order {
    var name: String
    var store: String
    var date: Date
    var wouldOrderAgain: Bool

    init(
        name: String = "",
        store: String = "",
        date: Date = .now,
        wouldOrderAgain: Bool = true
    ) {
        self.name = name
        self.store = store
        self.date = date
        self.wouldOrderAgain = wouldOrderAgain
    }
}
