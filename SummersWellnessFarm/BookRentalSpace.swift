//
//  BookRentalSpace.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/27/25.
//

import SwiftUI

struct RentalSpace: View{
    var body: some View{
        VStack{
            RentalSpaceView()
        }

        }
    }



struct RentalSpaceView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Book a Renal Space")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            Button(action: {
                print("Conference Room integration tapped")
            }) {
                Text("Conference Room")
                    .modifier(CustomButtonStyle())
            }
            
            Button(action: {
                print("Restaurant integration tapped")
            }) {
                Text("Restaurant")
                    .modifier(CustomButtonStyle())
            }
            
            Button(action: {
                print("Ballroom integration tapped")
            }) {
                Text("Ballroom")
                    .modifier(CustomButtonStyle())
            }
            
            Spacer()
        }
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
    RentalSpaceView()
}

