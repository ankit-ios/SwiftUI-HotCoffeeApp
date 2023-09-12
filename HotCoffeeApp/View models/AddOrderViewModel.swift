//
//  AddOrderViewModel.swift
//  HotCoffeeApp
//
//  Created by Ankit Sharma on 12/09/23.
//

import Foundation
import Combine
import SwiftUI

class AddOrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    
    func placeOrder() {
        CoreDataManager.shared.saveOrder(name: name, type: type)
    }
}
