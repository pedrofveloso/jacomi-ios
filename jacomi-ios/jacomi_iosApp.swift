//
//  jacomi_iosApp.swift
//  jacomi-ios
//
//  Created by Pedro Veloso on 24/10/24.
//

import SwiftData
import SwiftUI

@main
struct jacomi_iosApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
        .modelContainer(for: Order.self)
    }
}
