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
    @Query(sort: \Order.date, order: .reverse) var orders: [Order]

    @State private var navStackRoot = [Order]()
    @State private var searchText: String = ""

    private var filteredOrders: [Order] {
        orders.filter { order in
            order.name.starts(with: searchText)
        }
    }

    var body: some View {
        NavigationStack(path: $navStackRoot) {
            List {
                ForEach(filteredOrders) { order in
                    NavigationLink(value: order) {
                        VStack(alignment: .leading) {
                            Text(order.name)
                                .font(.headline)

                            Text(order.store)
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: deleteOrders(_:))
            }
            .searchable(text: $searchText)
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

    private func deleteOrders(_ indexSet: IndexSet) {
        for index in indexSet {
            let order = orders[index]
            modelContext.delete(order)
        }
    }
}

#Preview {
    HomeScreen()
}
