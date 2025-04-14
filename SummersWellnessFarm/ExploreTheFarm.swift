import SwiftUI
import MapKit

struct ExploreTheFarm: View {
    // Define the region for the map (Summers Branchville Farm, SC)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.3031, longitude: -80.6343), // Summers Branchville Farm coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        VStack {
            //title
            Text("Explore the Farm")
                .font(.custom("AvenirNext-Bold", size: 34))
                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                .padding(.top, 20)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                DashboardWideButton(title: "Book Activities")
                DashboardWideButton(title: "Farm Fresh Food")
                DashboardWideButton(title: "Resort Spaces and Themes")
            }
            
            //space between buttons and title
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
            Spacer() //push everything up

            //MAP
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true)
                .edgesIgnoringSafeArea(.bottom) //map fill screen
                .frame(maxHeight: .infinity)
                .padding(.top, 20)
        }
        .padding(.top, 20) //top of screen padding
    }
}

struct ExploreTheFarm_Previews: PreviewProvider {
    static var previews: some View {
        ExploreTheFarm()
    }
}






struct ExploreTheFarmNav: View {
    var body: some View {
        VStack{
            ExploreTheFarm()
        }
        .navigationTitle("Explore the Farm")
    }
}

