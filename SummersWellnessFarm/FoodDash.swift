//
//  FoodDash.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/26/25.
//

import SwiftUI

struct FoodDash: View {
    var body: some View {
        VStack{
          
        
            NavigationLink(destination: FoodPreferencesView()){
                Text("Benefits of Fresh Grown Food")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: FoodFormView(viewModel: GuestPreferencesViewModel())) {
                Text("Dietary Restrictions Form")
                    .modifier(CustomButtonStyle())
            }

            
    }
        .navigationTitle("Food Dashboard")
    }
}

#Preview {
    FoodDash()
}
