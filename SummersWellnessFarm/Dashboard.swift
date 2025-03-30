/*import SwiftUI
import SwiftData

struct Dashboard: View {
    @Environment(\.modelContext) private var modelContext
    @Query var bookings: [Booking]
    var viewModel: DashboardViewModel // Observe the view model
    var body: some View {
        VStack{
            Text("Dashboard")
                .font(.custom("AvenirNext-Regular", size: 34))
                .padding()
            
            SectionView(title: "Personal Info", content: """
            "Welcome, \(viewModel.user.name)!"
            - Room Number: 301
            - "Email: \(viewModel.user.email)"
            """)
            
            SectionView(title: "Booked Activities", content: bookedActivitiesText())
            
            NavigationLink(destination: BookActivities()){
                Text("Book Activities")
                    .modifier(CustomButtonStyle())
            }
            
            // Explore the farm button
            NavigationLink(destination: ExploreTheFarm()){
                Text("Explore The Farm")
                    .modifier(CustomButtonStyle())
            }
            
            // Quiz button
            NavigationLink(destination: ActivityRecs()){
                Text("Find Activity Recommendations")
                    .modifier(CustomButtonStyle())
            }
            
            // Watch integration button
            NavigationLink(destination: Watch()){
                Text("SmartWatch Integration")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: FoodPreferencesView()){
                Text("Food Dashboard")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: CalorieTrackerForm()){
                Text("Health")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: Recommendations()){
                Text("Personalized Recommendations")
                    .modifier(CustomButtonStyle())
            }
            
        }
        .navigationTitle("Dashboard")
    }
    
    
    func fetchBookings() {
        // Reload bookings from the model context
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    func bookedActivitiesText() -> String {
        if bookings.isEmpty {
            return "You have no booked activities."
        }
        
        let sortedBookings = bookings.sorted { $0.selectedTime < $1.selectedTime }
        
        return sortedBookings.map { booking in
            "- \(booking.activityName) on \(booking.selectedDay) at \(booking.selectedTime) for \(booking.bookedSlots) people"
        }.joined(separator: "\n")
    }
}*/
//comment
import SwiftUI
import SwiftData

struct Dashboard: View {
    @Environment(\.modelContext) private var modelContext
    @Query var bookings: [Booking]
    var viewModel: DashboardViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {

                // HEADER
                VStack(spacing: 8) {
                    Text("Dashboard")
                        .font(.custom("AvenirNext-Regular", size: 34))
                        .fontWeight(.bold)
                    Rectangle()
                        .frame(width: 60, height: 3)
                        .foregroundColor(Color(red: 195/255, green: 134/255, blue: 39/255))
                        .cornerRadius(2)
                }
                .padding(.top)

                // INFO CARDS
                HStack(spacing: 20) {
                    SectionView(title: "Personal Info", content: """
                    Welcome, \(viewModel.user.name)!
                    - Room Number: 301
                    - Email: \(viewModel.user.email)
                    """)

                    SectionView(title: "Booked Activities", content: bookedActivitiesText())
                }
                .padding(.horizontal)

                // BUTTONS
                VStack(spacing: 16) {
                    NavigationLink(destination: BookActivities()) {
                        Text("Book Activities")
                            .modifier(CustomButtonStyle())
                    }

                    NavigationLink(destination: ExploreTheFarm()) {
                        Text("Explore The Farm")
                            .modifier(CustomButtonStyle())
                    }

                    NavigationLink(destination: ActivityRecs()) {
                        Text("Find Activity Recommendations")
                            .modifier(CustomButtonStyle())
                    }

                    NavigationLink(destination: Watch()) {
                        Text("SmartWatch Integration")
                            .modifier(CustomButtonStyle())
                    }

                    NavigationLink(destination: FoodPreferencesView()) {
                        Text("Food Dashboard")
                            .modifier(CustomButtonStyle())
                    }

                    NavigationLink(destination: CalorieTrackerForm()) {
                        Text("Health")
                            .modifier(CustomButtonStyle())
                    }

                    NavigationLink(destination: Recommendations()) {
                        Text("Personalized Recommendations")
                            .modifier(CustomButtonStyle())
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Dashboard")
    }

    func fetchBookings() {
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }

    func bookedActivitiesText() -> String {
        if bookings.isEmpty {
            return "You have no booked activities."
        }

        let sortedBookings = bookings.sorted { $0.selectedTime < $1.selectedTime }

        return sortedBookings.map { booking in
            "- \(booking.activityName) on \(booking.selectedDay) at \(booking.selectedTime) for \(booking.bookedSlots) people"
        }.joined(separator: "\n")
    }
}
