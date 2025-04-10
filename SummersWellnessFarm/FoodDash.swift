//
//  FoodDash.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/26/25.
//

import SwiftUI

struct FoodDash: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                // LOGO + HEADER
                VStack(spacing: 8) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                    
        
                    Capsule()
                        .frame(width: 60, height: 4)
                        .foregroundColor(Color(red: 228/255, green: 173/255, blue: 102/255))
                }
                .padding(.top)
                
                
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
}
