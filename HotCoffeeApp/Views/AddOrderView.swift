//
//  AddOrderView.swift
//  HotCoffeeApp
//
//  Created by Ankit Sharma on 12/09/23.
//

import SwiftUI

struct AddOrderView: View {
    
    @State var addOrderVM: AddOrderViewModel
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self.addOrderVM = AddOrderViewModel()
        self._isPresented = isPresented //use _ when initializing the Binding variable
    }
    
    var body: some View {
        NavigationView {
            Group {
                VStack{
                    TextField("Enter Name", text: self.$addOrderVM.name)
                        .padding(20)
                    Picker("Coffee Type", selection: self.$addOrderVM.type) {
                        Text("Cappuccino").tag("Cappuccino")
                        Text("Regular").tag("Regular")
                        Text("Expresso").tag("Expresso")
                    }.pickerStyle(.segmented)
                    
                    Spacer()
                    
                    Button("Order") {
                        self.addOrderVM.placeOrder()
                        self.isPresented = false
                    }
                    .padding(10)
                    .font(.title)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    
                }.padding()
            }
            .navigationTitle("Place Order")
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
