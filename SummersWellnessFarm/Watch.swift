//
//  Watch.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/21/25.
//

import SwiftUI
// Navigation Link
struct Watch: View{
    var body: some View{
        VStack{
            WatchIntegrationView()
        }

        }
    }



struct WatchIntegrationView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Watch Integration")
                .font(.custom("AvenirNext-Bold", size: 34))
                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                .padding()
            
        
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                DashboardWideButton(title: "Fitbit")
                DashboardWideButton(title: "Garmin")
                DashboardWideButton(title: "Apple Watch")
            }
            
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
            Spacer()
           
        }
        .frame(maxWidth: .infinity)
    }
}
#Preview {
    WatchIntegrationView()
}


/* Button(action: {
     print("Fitbit integration tapped")
 }) {
     Text("Fitbit")
         .modifier(CustomButtonStyle())
 }
 
 Button(action: {
     print("Garmin integration tapped")
 }) {
     Text("Garmin")
         .modifier(CustomButtonStyle())
 }
 
 Button(action: {
     print("Apple Watch integration tapped")
 }) {
     Text("Apple Watch")
         .modifier(CustomButtonStyle())
 }*/
 
 //Spacer()
