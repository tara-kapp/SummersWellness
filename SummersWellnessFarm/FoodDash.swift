//
//  FoodDash.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/26/25.
//

import SwiftUI

struct FoodDash: View {
    @StateObject var guestPreferencesViewModel = GuestPreferencesViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                // LOGO + HEADER
                VStack(spacing: 8) {
                    Text("Food Dashboard")
                        .font(.custom("AvenirNext-Bold", size: 34))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                        .padding()
                    
                }
                .padding(.top)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    DashboardWideButton(title: "Benefits of Fresh Grown Food")
                    DashboardWideButton(title: "Dietary Restrictions Form", guestModel: guestPreferencesViewModel)
                    DashboardWideButton(title: "Meal Recommender", guestModel: guestPreferencesViewModel)
                    DashboardWideButton(title: "TODO: book a meal")
                }
                
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity)
                
//            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                DashboardWideButton(title: "Benefits of Fresh Grown Food")
//                DashboardWideButton(title: "Dietary Restrictions Form")
//            }
//                NavigationLink(destination: FoodPreferencesView()){
//                    Text("Benefits of Fresh Grown Food")
//                        .modifier(CustomButtonStyle())
//                }
//                
//                NavigationLink(destination: FoodFormView(viewModel: GuestPreferencesViewModel())) {
//                    Text("Dietary Restrictions Form")
//                        .modifier(CustomButtonStyle())
//                }
                
                
            }
            
        }
    }
    
