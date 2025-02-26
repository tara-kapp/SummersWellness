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
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            //buttons for Venues, Food, Activities
            VStack(spacing: 20) {
                Button(action: {
                    //venues button
                    print("Venues button tapped")
                }) {
                    Text("Venues")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }

                Button(action: {
                    //food button
                    print("Food button tapped")
                }) {
                    Text("Food")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }

                Button(action: {
                    //activity button
                    print("Activities button tapped")
                }) {
                    Text("Activities")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20) //space between buttons and title

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






// Navigation Link
struct ExploreTheFarmNav: View {
    var body: some View {
        VStack{
            ExploreTheFarm()

struct ExploreTheFarm: View {
    var body: some View {
        VStack{
            
        }
        .navigationTitle("Explore the Farm")
    }
}

#Preview {
    NavigationStack {
        ExploreTheFarm()
    }
}
