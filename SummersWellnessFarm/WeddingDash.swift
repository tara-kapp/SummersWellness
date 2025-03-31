//
//  WeddingDash.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/27/25.
//

/*import SwiftUI



struct WeddingDashboard: View {
    let viewModel: DashboardViewModel
    var body: some View {
        VStack{
            Text("Wedding Dashboard")
                .font(.custom("AvenirNext-Regular", size: 34))
                .padding()

            SectionView(title: "Group Info", content: """
            - Primary Contact Name: Jane Doe
            - Email: example@summerswellness.com
            - Group Size: 100 Guests
            """)
            

            NavigationLink(destination: LargeBookActivities()){
                Text("Book Activities")
                    .modifier(CustomButtonStyle())
            }
          
            // Explore the farm button
            NavigationLink(destination: ExploreTheFarm()){
                Text("Explore The Farm")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: CorporateBookingView()){
                Text("Book Rental Space")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: ResortPhotoGallery()){
                Text("View Resort Spaces and Themes")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: BookTour()){
                Text("Book a Tour")
                    .modifier(CustomButtonStyle())
            }

    }
        .navigationTitle("Dashboard")
    }
}*/

//LAYOUT 1
import SwiftUI

struct WeddingDashboard: View {
    let viewModel: DashboardViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {

                // LOGO + HEADER
                VStack(spacing: 8) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)

                    Text("Wedding Dashboard")
                        .font(.custom("Georgia-BoldItalic", size: 34))
                        .foregroundColor(Color(red: 62/255, green: 62/255, blue: 36/255).opacity(0.7))
                        .padding(.top, 30)

                    Capsule()
                        .frame(width: 60, height: 4)
                        .foregroundColor(Color(red: 228/255, green: 173/255, blue: 102/255))
                }
                .padding(.top)

                // INFO TILE
                VStack(alignment: .leading, spacing: 6) {
                    Text("Group Info")
                        .font(.custom("AvenirNext-Regular", size: 26))
                        .foregroundColor(Color(red: 62/255, green: 62/255, blue: 36/255))

                    Text("""
                    - Primary Contact Name: Jane Doe
                    - Email: example@summerswellness.com
                    - Group Size: 100 Guests
                    """)
                    .font(.custom("AvenirNext-Regular", size: 18))
                    .foregroundColor(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.08))
                .cornerRadius(16)
                .shadow(radius: 2)
                .padding(.horizontal, 24)

                // BUTTON GRID
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    DashboardWideButton(title: "Book Activities")
                    DashboardWideButton(title: "Explore The Farm")
                    DashboardWideButton(title: "Book Rental Space")
                    DashboardWideButton(title: "View Resort Spaces and Themes")
                    DashboardWideButton(title: "Book a Tour")
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.white)
    }
}
