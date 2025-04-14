//
//  FoodDash.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/26/25.
//
import SwiftUI
import SwiftData

struct FoodDash: View {
    @Environment(\.modelContext) private var modelContext
    @Query var mealBookings: [MealBooking]
    
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
                    
                    Capsule()
                        .frame(width: 60, height: 4)
                        .foregroundColor(Color(red: 228/255, green: 173/255, blue: 102/255))
                }
                .padding(.top)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    DashboardWideButton(title: "Benefits of Fresh Grown Food")
                    DashboardWideButton(title: "Dietary Restrictions Form", guestModel: guestPreferencesViewModel)
                    DashboardWideButton(title: "Meal Recommender", guestModel: guestPreferencesViewModel)
                    DashboardWideButton(title: "Book a Meal", guestModel: guestPreferencesViewModel)
                }
                .padding(.horizontal, 24)
                
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
}
