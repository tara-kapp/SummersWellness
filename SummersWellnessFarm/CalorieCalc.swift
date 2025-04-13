//
//  CalorieCalc.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 3/26/25.
//

import SwiftUI

struct CalorieResult: Identifiable {
    let id = UUID()
    let summary: String
}

struct CalorieTrackerForm: View {
    @State private var age: Int = 25
    @State private var gender: String = "Male"
    @State private var height: Double = 72
    @State private var weight: Double = 150

    @State private var expandedActivities: Set<String> = []
    @State private var selectedActivities: Set<String> = []
    @State private var activityDurations: [String: Int] = [:]
    @State private var activityIntensity: [String: String] = [:]

    @State private var breakfast: String = ""
    @State private var lunch: String = ""
    @State private var dinner: String = ""
    @State private var snack: String = ""
    
    @State private var steps: Double? = nil
    @State private var calories: Double? = nil
    @State private var hoursOfSleep: Double? = nil
    
    @State private var resultToShow: CalorieResult? = nil
    @State private var isLoading = false


    let genderOptions = ["Male", "Female", "Other"]
    let resortActivities = [
        "Yoga",
        "Pilates",
        "Nature Walk / Hike",
        "Strength Training",
        "Meditation",
        "Farm Tour",
        "Swimming",
        "Cycling",
        "Cooking Class",
        "Running"
    ]
    let intensityOptions = ["Light", "Moderate", "Vigorous"]

    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Health & Wellness Tracker")
                        .font(.custom("AvenirNext-Bold", size: 34))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                        .padding(.bottom, 10)
                    //User Info
                    GroupBox(label: Label("Your Info", systemImage: "person.fill")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))) {
                            
                        VStack(spacing: 10) {
                            Stepper("Age: \(age)", value: $age, in: 5...100)
                                .font(.custom("AvenirNext-Bold", size: 18))
                                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                            Text("Gender")
                                .font(.custom("AvenirNext-Bold", size: 22))
                                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))

                            Picker("Gender", selection: $gender) {
                                ForEach(genderOptions, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()


                            HStack {
                                Text("Height (in)")
                                    .font(.custom("AvenirNext-Bold", size: 18))
                                    .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                                Spacer()
                                TextField("Height", value: $height, format: .number)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                    .font(.custom("AvenirNext-Bold", size: 18))
                                    .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                            }

                            HStack {
                                Text("Weight (lbs)")
                                    .font(.custom("AvenirNext-Bold", size: 18))
                                    .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                                Spacer()
                                TextField("Weight", value: $weight, format: .number)
                                    .keyboardType(.decimalPad)
                                    .multilineTextAlignment(.trailing)
                                    .font(.custom("AvenirNext-Bold", size: 18))
                                    .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                            }
                        }
                        .padding(.top, 5)
                    }

                    // 💪 Activities
                    GroupBox(label: Label("Today's Activities", systemImage: "flame.fill")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))) {
                        ForEach(resortActivities, id: \.self) { activity in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(activity)
                                        .font(.custom("AvenirNext-Regular", size: 20))
                                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                                    Spacer()
                                    Button(action: {
                                        withAnimation {
                                            if expandedActivities.contains(activity) {
                                                expandedActivities.remove(activity)
                                                selectedActivities.remove(activity)
                                            } else {
                                                expandedActivities.insert(activity)
                                                selectedActivities.insert(activity)
                                            }
                                        }
                                    }) {
                                        Image(systemName: expandedActivities.contains(activity) ? "chevron.down" : "chevron.right")
                                            .foregroundColor(Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08))
                                    }
                                }

                                if expandedActivities.contains(activity) {
                                    VStack(alignment: .leading) {
                                        Stepper("Duration: \(activityDurations[activity, default: 30]) min", value: Binding(get: {
                                            activityDurations[activity, default: 30]
                                        }, set: { newValue in
                                            activityDurations[activity] = newValue
                                        }), in: 1...240)

                                        Picker("Intensity", selection: Binding(get: {
                                            activityIntensity[activity, default: "Moderate"]
                                        }, set: { newValue in
                                            activityIntensity[activity] = newValue
                                        })) {
                                            ForEach(intensityOptions, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                        .pickerStyle(SegmentedPickerStyle())
                                    }
                                    .padding(.leading, 10)
                                }

                                Divider()
                            }
                        }
                    }
                    
                    GroupBox(label: Label("General Info", systemImage: "flame.fill")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))){
                        VStack(alignment: .leading, spacing: 15) {
                            KnownItemEntry(title: "Steps (Walking Only)", itemValue: $steps)
                                .font(.custom("AvenirNext-Regular", size: 17))
                                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                            KnownItemEntry(title: "Known Calories Burned(Do not do this and enter activities)", itemValue: $calories)
                                .font(.custom("AvenirNext-Regular", size: 17))
                                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                            KnownItemEntry(title: "Known Hours of Sleep", itemValue: $hoursOfSleep)
                                .font(.custom("AvenirNext-Regular", size: 17))
                                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                        }
                    }

                    // 🍽️ Meals
                    GroupBox(label: Label("Today's Meals", systemImage: "fork.knife")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))) {
                        VStack(alignment: .leading, spacing: 15) {
                            MealEntry(title: "Breakfast", mealText: $breakfast)
                            MealEntry(title: "Lunch", mealText: $lunch)
                            MealEntry(title: "Dinner", mealText: $dinner)
                            MealEntry(title: "Snack", mealText: $snack)
                        }
                    }

                    // Submit Button
                                        Button("Submit") {
                                            // Dismiss any focused fields.
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            
                                            isLoading = true
                                            resultToShow = nil

                                            sendCalorieData(
                                                age: age,
                                                gender: gender,
                                                height: height,
                                                weight: weight,
                                                selectedActivities: selectedActivities,
                                                activityDurations: activityDurations,
                                                activityIntensity: activityIntensity,
                                                steps: steps,
                                                calories: calories,
                                                hoursOfSleep: hoursOfSleep,
                                                breakfast: breakfast,
                                                lunch: lunch,
                                                dinner: dinner,
                                                snack: snack
                                            ) { result in
                                                DispatchQueue.main.async {
                                                    isLoading = false
                                                    switch result {
                                                    case .success(let output):
                                                        resultToShow = CalorieResult(summary: output)
                                                    case .failure(let error):
                                                        resultToShow = CalorieResult(summary: "Error: \(error.localizedDescription)")
                                                    }
                                                }
                                            }
                                        }
                                        .buttonStyle(.borderedProminent)
                                        .disabled(isLoading)

                                    }
                                    .padding()
                                }
            
            .sheet(item: $resultToShow) { result in
                VStack(spacing: 20) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(result.summary.components(separatedBy: "\n"), id: \.self) { line in
                                if line.lowercased().contains("meal calorie") {
                                    Label(line, systemImage: "fork.knife")
                                        .font(.custom("AvenirNext-Regular", size: 20))
                                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                                } else if line.lowercased().contains("activity calorie") {
                                    Label(line, systemImage: "flame")
                                        .font(.custom("AvenirNext-Regular", size: 20))
                                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                                } else if line.lowercased().contains("summary") {
                                    Text("📝 " + line)
                                        .font(.custom("AvenirNext-Bold", size: 22))
                                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                                        .padding(.top, 8)
                                } else {
                                    Text(line)
                                        .font(.body)
                                }
                            }
                        }
                        .padding()
                    }

                    Button("Close") {
                        resultToShow = nil
                    }
                    .padding(.top)
                }
                .padding()
            }

                            }
                        }
                    


struct MealEntry: View {
    var title: String
    @Binding var mealText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            TextField("What did you eat?", text: $mealText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct KnownItemEntry: View {
    var title: String
    @Binding var itemValue: Double?  // This is the external binding
    
    // Local state to hold the text input.
    @State private var textValue: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            TextField("How many?", text: $textValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .onChange(of: textValue) { newValue in
                    let trimmed = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
                    if trimmed.isEmpty {
                        itemValue = nil
                        print("Text empty, set itemValue to nil")
                    } else if let value = Double(trimmed) {
                        itemValue = value
                        print("Converted '\(trimmed)' to \(value)")
                    } else {
                        itemValue = nil
                        print("Conversion failed for: '\(trimmed)'")
                    }
                }
        }
        .onAppear {
            // When this view first appears, if there's an existing value, show it.
            if let value = itemValue {
                textValue = String(value)
            }
        }
    }
}


#Preview {
    CalorieTrackerForm()
}
