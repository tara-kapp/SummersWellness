/*import SwiftUI

class GuestPreferencesViewModel: ObservableObject {
    @Published var guests: [GuestPreferences] = []
    @Published var currentGuest: GuestPreferences? = nil

    func addGuest(name: String, allergies: String, diets: [String], specialRequests: String) {
        let newGuest = GuestPreferences(name: name, allergies: allergies, diets: diets, specialRequests: specialRequests)
        currentGuest = newGuest
        guests.append(newGuest)
    }
}

struct GuestPreferences: Identifiable, Codable {
    let id = UUID()
    var name: String
    var allergies: String
    var diets: [String]
    var specialRequests: String
}

struct FoodFormView: View {
    @State private var name = ""
    @State private var allergies = ""
    @State private var specialRequests = ""
    @State private var selectedDiets: Set<String> = []
    @State private var customDiet = ""
    @State private var showConfirmation = false

    @ObservedObject var viewModel: GuestPreferencesViewModel

    let dietOptions = ["Vegan", "Gluten Free", "Pescatarian", "Other"]

    var body: some View {
        Form {
            Section(header: Text("Guest Information")) {
                TextField("Name", text: $name)
            }

            Section(header: Text("Dietary Preferences")) {
                TextField("Allergies", text: $allergies)
            }

            Section(header: Text("Select Your Diet Preferences")) {
                ForEach(dietOptions, id: \.self) { option in
                    Toggle(option, isOn: Binding(
                        get: { selectedDiets.contains(option) },
                        set: { isSelected in
                            if isSelected {
                                selectedDiets.insert(option)
                            } else {
                                selectedDiets.remove(option)
                            }
                        }
                    ))
                }

                if selectedDiets.contains("Other") {
                    TextField("Please specify", text: $customDiet)
                }
            }

            Section(header: Text("Special Requests")) {
                TextField("Special Requests", text: $specialRequests)
            }

            Button("Submit") {
                var finalDiets = Array(selectedDiets)
                if selectedDiets.contains("Other"), !customDiet.isEmpty {
                    finalDiets.append(customDiet)
                }

                viewModel.addGuest(name: name, allergies: allergies, diets: finalDiets, specialRequests: specialRequests)
                showConfirmation = true

                // Don't clear fields — keep them filled to reflect saved state
            }

            if showConfirmation, let guest = viewModel.currentGuest {
                Section {
                    Text("Saved preferences for \(guest.name)")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                }

                NavigationLink(destination: MealView(viewModel: viewModel)) {
                    Text("Go to Meal Recommender")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                }
            }
        }
        
        .onAppear {
            if let guest = viewModel.currentGuest {
                name = guest.name
                allergies = guest.allergies
                specialRequests = guest.specialRequests
                selectedDiets = Set(guest.diets.filter { dietOptions.contains($0) })
                customDiet = guest.diets.first(where: { !dietOptions.contains($0) }) ?? ""
            }
        }
    }
}*/

import SwiftUI

class GuestPreferencesViewModel: ObservableObject {
    @Published var guests: [GuestPreferences] = []
    @Published var currentGuest: GuestPreferences? = nil

    func addGuest(name: String, allergies: String, diets: [String], specialRequests: String) {
        let newGuest = GuestPreferences(name: name, allergies: allergies, diets: diets, specialRequests: specialRequests)
        currentGuest = newGuest
        guests.append(newGuest)
    }
}

struct GuestPreferences: Identifiable, Codable {
    let id = UUID()
    var name: String
    var allergies: String
    var diets: [String]
    var specialRequests: String
}

struct FoodFormView: View {
    @State private var name = ""
    @State private var allergies = ""
    @State private var specialRequests = ""
    @State private var selectedDiets: Set<String> = []
    @State private var customDiet = ""
    @State private var showConfirmation = false

    @ObservedObject var viewModel: GuestPreferencesViewModel

    let dietOptions = ["Vegan", "Gluten Free", "Pescatarian", "Other"]

    let background = Color(red: 228/255, green: 173/255, blue: 102/255).opacity(0.03)
    let sectionBackground = Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08)
    let textColor = Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85)

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    Text("Guest Information")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    TextField("Name", text: $name)
                        .padding()
                        .background(sectionBackground)
                        .cornerRadius(8)
                }

                Group {
                    Text("Dietary Preferences")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    TextField("Allergies", text: $allergies)
                        .padding()
                        .background(sectionBackground)
                        .cornerRadius(8)
                }

                Group {
                    Text("Select Your Diet Preferences")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: 10) {
                        ForEach(dietOptions, id: \.self) { option in
                            Toggle(option, isOn: Binding(
                                get: { selectedDiets.contains(option) },
                                set: { isSelected in
                                    if isSelected {
                                        selectedDiets.insert(option)
                                    } else {
                                        selectedDiets.remove(option)
                                    }
                                }
                            ))
                            .font(.custom("AvenirNext-Regular", size: 22))
                            .foregroundColor(textColor)
                        }

                        if selectedDiets.contains("Other") {
                            TextField("Please specify", text: $customDiet)
                                .padding()
                                .background(sectionBackground)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(sectionBackground)
                    .cornerRadius(10)
                }

                Group {
                    Text("Special Requests")
                        .font(.custom("AvenirNext-Bold", size: 17))
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    TextField("Special Requests", text: $specialRequests)
                        .padding()
                        .background(sectionBackground)
                        .cornerRadius(8)
                }

                Button("Submit") {
                    var finalDiets = Array(selectedDiets)
                    if selectedDiets.contains("Other"), !customDiet.isEmpty {
                        finalDiets.append(customDiet)
                    }

                    viewModel.addGuest(name: name, allergies: allergies, diets: finalDiets, specialRequests: specialRequests)
                    showConfirmation = true
                }
                .font(.custom("AvenirNext-Regular", size: 22))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 67/255, green: 103/255, blue: 70/255))
                .foregroundColor(.white)
                .cornerRadius(10)

                if showConfirmation, let guest = viewModel.currentGuest {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Saved preferences for \(guest.name)")
                            .font(.custom("AvenirNext-Regular", size: 17))
                            .foregroundColor(textColor)

                        NavigationLink(destination: MealView(viewModel: viewModel)) {
                            Text("Go to Meal Recommender")
                                .font(.custom("AvenirNext-Bold", size: 17))
                                .foregroundColor(textColor)
                                .underline(true, color: textColor)
                        }
                    }
                    .padding()
                    .background(sectionBackground)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .background(background.ignoresSafeArea())
        .onAppear {
            if let guest = viewModel.currentGuest {
                name = guest.name
                allergies = guest.allergies
                specialRequests = guest.specialRequests
                selectedDiets = Set(guest.diets.filter { dietOptions.contains($0) })
                customDiet = guest.diets.first(where: { !dietOptions.contains($0) }) ?? ""
            }
        }
    }
}

