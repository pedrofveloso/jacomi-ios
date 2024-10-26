//
//  OrderScreen.swift
//  jacomi-ios
//
//  Created by Pedro Veloso on 26/10/24.
//

import SwiftUI

struct OrderScreen: View {
    @Bindable var order: Order

    var body: some View {
        Form {
            Section("Loja") {
                TextField("Nome da loja", text: $order.store)
            }

            Section("Pedido") {
                TextField("Nome", text: $order.name)
                DatePicker("Data do pedido", selection: $order.date)
                Toggle("Pediria de novo", isOn: $order.wouldOrderAgain)
            }
        }
    }
}

#Preview {
    OrderScreen(order: .init())
}
