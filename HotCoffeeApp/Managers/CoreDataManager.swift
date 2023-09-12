//
//  CoreDataManager.swift
//  HotCoffeeApp
//
//  Created by Ankit Sharma on 12/09/23.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager(moc: PersistenceController.shared.container.viewContext)
    
    private let moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    
    //Fetch
    func getAllOrders() -> [Order] {
        
        var orders = [Order]()
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            orders = try moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return orders
    }
    
    //Save
    func saveOrder(name: String, type: String) {
        let order = Order(context: moc)
        order.name = name
        order.type = type
        
        do {
            try moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    //delete
    func deleteOrder(name: String) {
        if let order = fetchOrder(name: name) {
            do {
                moc.delete(order)
                try moc.save()
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
    //fetch
    func fetchOrder(name: String) -> Order? {
        var orders = [Order]()
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        orderRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            orders = try moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return orders.first
    }
}

