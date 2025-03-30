//
//  ContentView.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/16/25.

import SwiftUI

struct CustomButtonStyle: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.custom("AvenirNext-Regular", size: 17))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: 200)
            .background(
                            Color(red: 129/255, green: 100/255, blue: 73/255).opacity(0.7)
                        )
            .cornerRadius(10)
            .shadow(radius:5)
    }
}
