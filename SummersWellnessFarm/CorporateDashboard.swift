//
//  CorporateDashboard.swift
//  SummersWellnessFarm
//
//  Created by Tia Li on 3/11/25.
//

import SwiftUI
import SwiftData

struct CorporateDashboard: View {
    var body: some View {
        VStack{
            Text("Corporate Dashboard")
                .font(.largeTitle)
                .padding()

            SectionView(title: "Group Info", content: """
            - Primary Contact Name: Jane Doe
            - Email: example@summerswellness.com
            - Group Size: 50 Guests
            """)
            
            SectionView(title: "Booked Items", content: """
            - Activity: Yoga Class (Date: 10/15/2023)
            - Rental Space: Conference Room A (Date: 10/16/2023)
            - Activity: Farm Tour (Date: 10/17/2023)
            """)
            
            

            NavigationLink(destination: LargeBookActivities()){
                Text("Book Activities")
                    .modifier(CustomButtonStyle())
            }
          
            
            NavigationLink(destination: ExploreTheFarm()){
                Text("Explore The Farm")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: CorporateBookingView()){
                Text("Book Rental Space")
                    .modifier(CustomButtonStyle())
            }

    }
        .navigationTitle("Dashboard")
    }
}

#Preview {
    CorporateDashboard()
}
