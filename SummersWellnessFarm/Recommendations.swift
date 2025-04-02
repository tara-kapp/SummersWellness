//
//  Recommendations.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 2/26/25.
//

import SwiftUI

struct Recommendations: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Section
                Text("Personalized Recommendations")
                    .font(.custom("AvenirNext-Regular", size: 34))
                    .fontWeight(.bold)
                    .padding(.top, 20)

                // Sustainability Section
                SectionView(title: "Health", content: """
                Our Farm to Table Experience
                """)
                SectionView(title: "Outdoor", content: """
                Our outdoor Nature Walk/Hikes
                """)
                SectionView(title: "Excercise", content: """
                Yoga
                Pilates
                """)


                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}


#Preview {
    NavigationStack {
        Recommendations()
    }
}

