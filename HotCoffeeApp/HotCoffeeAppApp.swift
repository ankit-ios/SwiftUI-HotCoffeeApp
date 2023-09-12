//
//  HotCoffeeAppApp.swift
//  HotCoffeeApp
//
//  Created by Ankit Sharma on 12/09/23.
//

import SwiftUI

@main
struct HotCoffeeAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            
            //This is for OrderList app
            OrderListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            //Use ContentView for addItem app
            //            ContentView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
