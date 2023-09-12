//
//  OrderListView.swift
//  HotCoffeeApp
//
//  Created by Ankit Sharma on 12/09/23.
//

import SwiftUI

struct OrderListView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    @State var isPresented: Bool = false
    
    init() {
        orderListVM = OrderListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(orderListVM.orders, id: \.name) { order in
                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(.title)
                            .foregroundColor(.black)
                        Text(order.type).font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: deleteOrder)
            }
            .sheet(isPresented: $isPresented,
                   onDismiss: {
                orderListVM.fetchAllOrders()
            }, content: {
                AddOrderView(isPresented: $isPresented)
            })
            .navigationTitle("Orders")
            .navigationBarItems(trailing: Button("Place Order") {
                isPresented = true
            })
        }
    }
    
    private func deleteOrder(for offSet: IndexSet) {
        offSet.forEach { index in
            orderListVM.deleteOrder(viewModel: orderListVM.orders[index])
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
