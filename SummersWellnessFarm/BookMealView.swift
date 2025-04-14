import SwiftUI
import SwiftData

@Model
class MealBooking: Identifiable{
    var type: String
    var selectedTime: String
    var mealOption: String
    var notes: String?

    init(type: String, selectedTime: String, mealOption: String, notes: String? = nil) {
        self.type = type
        self.selectedTime = selectedTime
        self.mealOption = mealOption
        self.notes = notes
    }
}


struct BookMealView: View {
    @State private var mealType: String = "Restaurant"
    @State private var selectedTime: Date = Date()
    @State private var selectedMeal: String = "Select a Meal"
    @State private var notes: String = ""
    @State private var showMealSelectionSheet: Bool = false
    @State private var showConfirmation = false
    
    @Environment(\.modelContext) private var modelContext
    let menu = dummyMenu
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                // Title
                Text("Book a Meal")
                    .font(.custom("AvenirNext-Bold", size: 34))
                    .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                    .padding(.horizontal)
                
                // Meal categories
                ForEach(menu.keys.sorted(), id: \.self) { category in
                    VStack(alignment: .leading, spacing: 16) {
                        Text(category)
                            .font(.custom("AvenirNext-Bold", size: 22))
                            .foregroundColor(Color(red: 67/255, green: 103/255, blue: 70/255))
                            .padding(.horizontal)
                        
                        // Meals in the category
                        ForEach(menu[category]!, id: \.self) { meal in
                            Button(action: {
                                // Show meal selection form (sheet)
                                self.selectedMeal = meal
                                self.showMealSelectionSheet = true
                            }) {
                                HStack {
                                    Text(meal)
                                        .font(.custom("AvenirNext-Regular", size: 18))
                                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255))
                                    Spacer()
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .sheet(isPresented: $showMealSelectionSheet) {
            // Full-screen sheet for meal booking details
            VStack {
                Text("Select Meal Type & Time")
                    .font(.custom("AvenirNext-Bold", size: 22))
                    .padding()
                
                // Meal Type Selection
                Picker("Meal Type", selection: $mealType) {
                    Text("Room Service").tag("Room Service")
                    Text("Restaurant").tag("Restaurant")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Time Picker
                DatePicker(
                    "Select Time",
                    selection: $selectedTime,
                    displayedComponents: .hourAndMinute
                )
                .padding()
                
                // Notes Field
                TextField("Additional Notes (e.g. dietary restrictions)", text: $notes)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Confirm Button
                Button(action: {
                    let mealBooking = MealBooking(
                        type: mealType,
                        selectedTime: formatTime(selectedTime),
                        mealOption: selectedMeal,
                        notes: notes
                    )
                    
                    modelContext.insert(mealBooking) // ← This line is missing in your code
                    
                    do {
                        try modelContext.save()
                        print("Booking Confirmed: \(mealBooking)")
                        
                        self.showMealSelectionSheet = false
                    } catch {
                        print("Failed to save meal booking: \(error.localizedDescription)")
                    }
                }) {
                    Text("Confirm Booking")
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                }
                
                
                Button("Cancel", role: .cancel) {
                    self.showMealSelectionSheet = false // Close sheet
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

    // Helper function to format time as a string (e.g., "2:30 PM")
    func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

// Dummy Menu
let dummyMenu: [String: [String]] = [
    "Breakfast": [
        "Avocado Toast with Poached Egg",
        "Greek Yogurt with Berries and Granola",
        "Overnight Oats with Almond Milk and Chia Seeds",
        "Spinach and Feta Omelette",
        "Berry Smoothie with Protein Powder",
        "Banana Pancakes with Maple Syrup",
        "Scrambled Eggs with Whole Grain Toast",
        "Breakfast Burrito with Eggs and Veggies",
        "Mini Veggie Frittatas",
        "Whole Wheat Bagel with Cream Cheese and Tomato"
    ],
    "Lunch": [
        "Quinoa Salad with Chickpeas and Lemon Vinaigrette",
        "Sweet Potato and Black Bean Tacos",
        "Lentil Soup with Whole Grain Bread",
        "Cucumber and Hummus Sandwich",
        "Turkey and Spinach Wrap",
        "Grilled Chicken Caesar Wrap",
        "Caprese Sandwich with Pesto Mayo",
        "Vegetable Stir Fry with Jasmine Rice",
        "Tomato Basil Soup with Grilled Cheese",
        "Asian Chicken Salad with Sesame Dressing"
    ],
    "Dinner": [
        "Grilled Salmon with Asparagus",
        "Tofu Stir Fry with Brown Rice",
        "Vegetable Curry with Basmati Rice",
        "Eggplant Parmesan with Whole Wheat Pasta",
        "Stuffed Bell Peppers with Ground Turkey and Quinoa",
        "Grilled Chicken Buddha Bowl",
        "Herb-Roasted Chicken Thighs with Potatoes",
        "Chickpea and Spinach Stew",
        "Pasta Primavera with Olive Oil and Garlic",
        "Baked Cod with Lemon and Green Beans"
    ],
    "Snack": [
        "Granola Bar",
        "Banana",
        "Apple Slices",
        "Crackers and Cottage Cheese",
        "Prosciutto Mozzarella Roll-up",
        "Greek Yogurt Cup",
        "Trail Mix",
        "Cheese Cubes and Grapes",
        "Hummus with Pretzel Sticks",
        "Peanut Butter Pack with Celery Sticks"
    ]
]
