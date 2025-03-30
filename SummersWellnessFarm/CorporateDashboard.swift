//
//  CorporateDashboard.swift
//  SummersWellnessFarm
//
//  Created by Tia Li on 3/11/25.
//

import SwiftUI
import SwiftData

struct CorporateDashboard: View {
    let viewModel: DashboardViewModel
    
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
                
                .navigationTitle("Dashboard")
            }
        }
    }
