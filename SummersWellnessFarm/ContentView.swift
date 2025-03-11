//
//  ContentView.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/16/25.

import SwiftUI

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
            NavigationLink(destination: WeddingDashboard()){
                Text("Corporate Dashboard")
                    .modifier(CustomButtonStyle())
            }
                    }

        Text("Summers Wellness Farm")
            .font(.largeTitle)
                .padding()
        Text("Welcome Name!")

    }
}
