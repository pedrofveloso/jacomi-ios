//
//  HomeScreen.swift
//  jacomi-ios
//
//  Created by Pedro Veloso on 24/10/24.
//

import SwiftData
import SwiftUI

struct HomeScreen: View {
    @Environment(\.modelContext) var modelContext
    @Query var orders: [Order]

    @State private var navStackRoot = [Order]()

    var body: some View {
        NavigationStack(path: $navStackRoot) {
            List {
                ForEach(orders) { order in
                    NavigationLink(value: order) {
                        VStack(alignment: .leading) {
                            Text(order.name)
                                .font(.headline)

                            Text(order.store)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationDestination(for: Order.self, destination: OrderScreen.init)
            .navigationTitle("Ja Comi")
            .toolbar {
                Button {
                    let order = Order()
                    modelContext.insert(order)
                    navStackRoot.append(order)

                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }

    private func addSamples() {
        let order1 = Order(name: "Pizza de Mussarela", store: "Di Monstro")
        let order2 = Order(name: "Esfirra de carne", store: "Saj")

        modelContext.insert(order1)
        modelContext.insert(order2)
    }
}

#Preview {
    HomeScreen()
}
