//
//  WeddingDash.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/27/25.
//

import SwiftUI



struct WeddingDashboard: View {
    let viewModel: DashboardViewModel
    
    var body: some View {
        VStack{
            Text("Wedding Dashboard")
                .font(.largeTitle)
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
}

