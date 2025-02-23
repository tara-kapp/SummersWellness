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
}

#Preview {
    Dashboard()
}
