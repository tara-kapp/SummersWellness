//
//  MealRecommendation.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 4/9/25.
//

import SwiftUI

struct MealView: View {
    @ObservedObject var viewModel: GuestPreferencesViewModel
    @State private var selectedPreferences: Set<String> = []
    @State private var selectedMeal: String = "Breakfast"
    @State private var aiRecommendation: String = "Your recommendation will appear here."
    @State private var isLoading: Bool = false

    let mealOptions = ["Breakfast", "Lunch", "Dinner", "Snack"]

    let preferences = [
        "Weight Loss", "Weight Gain", "Energy", "Better Sleep", "Healthy Eating", "Muscle Gain", "Heart Healthy", "Brain Food", "Low Sugar"
    ]

    var body: some View {
        VStack {
            Text("AI Meal Generator")
                .font(.largeTitle)
                .font(.custom("AvenirNext-Bold", size: 34))
                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                .padding(.bottom, 10)

            // 🔹 Meal Selection Section
            Section {
                Picker("Select a Meal", selection: $selectedMeal) {
                    ForEach(mealOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }

            Text("Select Your Preferences")
                .font(.title2)
                .font(.custom("AvenirNext-Bold", size: 24))
                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                .padding(.top)

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach(preferences, id: \.self) { preference in
                        Button(action: {
                            toggleSelection(for: preference)
                        }) {
                            Text(preference)
                                .font(.custom("AvenirNext-Regular", size: 17))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedPreferences.contains(preference)
                                            ? Color(red: 67/255, green: 103/255, blue: 70/255).opacity(0.9)
                                            : Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08))
                                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }

            if isLoading {
                ProgressView("Getting Recommendation...")
                    .font(.custom("AvenirNext-Regular", size: 22))
                    .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                    .padding()
            }

            Button(action: {
                isLoading = true
                let combinedPreferences = Array(selectedPreferences) + [selectedMeal]
                fetchMealAIRecommendation(preferences: combinedPreferences, dietaryInfo: viewModel.currentGuest) { result in
                    DispatchQueue.main.async {
                        aiRecommendation = result ?? "Something went wrong."
                        isLoading = false
                    }
                }
            }) {
                Text("Get Recommendation")
                    .font(.custom("AvenirNext-Regular", size: 22))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 67/255, green: 103/255, blue: 70/255))
                    .cornerRadius(10)
                    .padding()
            }

            Text(aiRecommendation)
                .font(.custom("AvenirNext-Regular", size: 17))
                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08))
                .cornerRadius(10)
        }
        .padding()
        .background(Color(red: 228/255, green: 173/255, blue: 102/255).opacity(0.03))
    }

    private func toggleSelection(for preference: String) {
        if selectedPreferences.contains(preference) {
            selectedPreferences.remove(preference)
        } else {
            selectedPreferences.insert(preference)
        }
    }
}
