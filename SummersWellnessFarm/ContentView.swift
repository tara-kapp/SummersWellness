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
    @StateObject private var userSession = UserSession()

    var body: some View {
        NavigationStack {
            LoginView()
        }
        .environmentObject(userSession) // ✅ Share session across views
    }
}
