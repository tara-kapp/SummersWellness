

//LAYOUT 1
import SwiftUI
import SwiftData

struct WeddingDashboard: View {
    @EnvironmentObject var userSession: UserSession
    let viewModel: DashboardViewModel
    @Environment(\.modelContext) private var modelContext
    @Query var bookings: [Booking]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                
                // LOGO + HEADER
                VStack(spacing: 8) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                    
                    Text("Wedding Dashboard")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                        .padding(.top, 20)
                    
                    Capsule()
                        .frame(width: 60, height: 4)
                        .foregroundColor(Color(red: 228/255, green: 173/255, blue: 102/255))
                }
                .padding(.top)
                
                // INFO DISPLAY
                    VStack(alignment: .center, spacing: 6) {
                        Text("Group Info")
                            .font(.custom("AvenirNext-Regular", size: 26))
                            .foregroundColor(Color(red: 62/255, green: 62/255, blue: 36/255))
                        
                        VStack(alignment: .center, spacing: 4) {
                            Text("Welcome, \(viewModel.user.name)!")
                            Text("Email: \(viewModel.user.email)")
                        }
                        .font(.custom("AvenirNext-Regular", size: 18))
                        .foregroundColor(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08))
                    .cornerRadius(16)
                    .shadow(radius: 2)
                    
                    // BUTTON GRID
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        DashboardWideButton(title: "Book Large Group Activities")
                        DashboardWideButton(title: "Explore the Farm")
                        DashboardWideButton(title: "Book Rental Space")
                        DashboardWideButton(title: "View Resort Spaces and Themes")
                        DashboardWideButton(title: "Book a Tour")
                        DashboardWideButton(title: "Farm Fresh Food")
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color(red: 228/255, green: 173/255, blue: 102/255).opacity(0.03))
        }
    }
