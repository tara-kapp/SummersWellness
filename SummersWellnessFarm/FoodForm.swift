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
                        .foregroundColor(.green)
                        .bold()
                }

                NavigationLink(destination: MealView(viewModel: viewModel)) {
                    Text("Go to Meal Recommender")
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationTitle("Food Form")
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
