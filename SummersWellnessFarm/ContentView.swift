//
//  ContentView.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/16/25.

import SwiftUI

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

struct ContentView: View {
    var body: some View {


    
        NavigationStack{
            Text("Summers Wellness Farm")
                .font(.largeTitle)
                .padding()
            Text("Welcome Name!")
            
            
            // Dashboard button
            NavigationLink(destination: Dashboard()){
                Text("Personal Dashboard")
                    .modifier(CustomButtonStyle())
            }
            NavigationLink(destination: WeddingDashboard()){
                Text("Wedding Dashboard")
                    .modifier(CustomButtonStyle())
            }
            NavigationLink(destination: CorporateDashboard()){
                Text("Corporate Dashboard")
                    .modifier(CustomButtonStyle())
            }
            // Temporarily placed here. 
            NavigationLink(destination: UserPreferencesView()){
                Text("User Preferences AI Quiz")
                    .modifier(CustomButtonStyle())
            }
            
                    }

        Text("Summers Wellness Farm")
            .font(.largeTitle)
                .padding()
        Text("Welcome Name!")

    }
}
