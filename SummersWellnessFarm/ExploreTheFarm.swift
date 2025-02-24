import SwiftUI

struct ExploreTheFarm: View {
    var body: some View {
        VStack {
            Text("Explore the Farm")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Explore the Farm page will include a map of the farm to highlight event spaces, activities, etc. that the user can look through")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

