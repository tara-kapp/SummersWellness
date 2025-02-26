//
//  Dashboard.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/19/25.
//

import SwiftUI



struct Dashboard: View {
    var body: some View {
        VStack{
            Text("Dashboard")
                .font(.largeTitle)
                .padding()

            SectionView(title: "Personal Info", content: """
            - Name: Jane Doe
            - Room Number: 301
            - Email: example@summerswellness.com
            """)
            
            SectionView(title: "Booked Activities", content: """
            - Farm to Table Experience: 2/28 at 7:00pm
            - Outdoor Yoga: 2/29 at 8:00am
            - Massage: 2/29 at 11:00am
            """)

            // Activities button
            NavigationLink(destination: BookActivities()){
                Text("Book Activities")
                    .modifier(CustomButtonStyle())
            }
          
            // Explore the farm button
            NavigationLink(destination: ExploreTheFarm()){
                Text("Explore The Farm")
                    .modifier(CustomButtonStyle())
            }
            
            // Watch integration button
            NavigationLink(destination: Watch()){
                Text("SmartWatch Integration")
                    .modifier(CustomButtonStyle())
            }
            
            NavigationLink(destination: FoodDash()){
                Text("Food Dashboard")
                    .modifier(CustomButtonStyle())
            }
            NavigationLink(destination: Recommendations()){
                Text("Personalized Recommendations")
                    .modifier(CustomButtonStyle())
            }

    }
        .navigationTitle("Dashboard")
    }
}

struct CustomButtonStyle: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: 200)
            .background(Color.green)
            .cornerRadius(10)
            .shadow(radius:5)
    }
        struct Dashboard: View {
            var body: some View {
                Text("Dashboard")
                    .font(.largeTitle)
                    .padding()
                
            }
        }
    }

#Preview {
    Dashboard()
}
