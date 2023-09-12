//
//  OrderListViewModel.swift
//  HotCoffeeApp
//
//  Created by Ankit Sharma on 12/09/23.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders: [OrderViewModel] = []
    let manager: CoreDataManager
    
    init() {
        manager = CoreDataManager.shared
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        orders = manager.getAllOrders().map(OrderViewModel.init)
    }
    
    func deleteOrder(viewModel: OrderViewModel) {
        manager.deleteOrder(name: viewModel.name)
        fetchAllOrders()
    }
}


struct OrderViewModel {
    var name: String
    var type: String
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
