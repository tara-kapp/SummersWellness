//
//  RentalSpace.swift
//  SummersWellnessFarm
//
//  Created by Tia Li on 3/9/25.
//
import SwiftUI

struct RentalSpace: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let pricePerDay: Double
    let imageName: String
}

struct BookingView: View {
    @State private var selectedDate = Date()
    @State private var selectedSpace: RentalSpace?
    @State private var showingConfirmation = false
    
    let rentalSpaces: [RentalSpace] = [
        RentalSpace(name: "Executive Barn Suite", description: "A stylish barn-inspired suite with a private meeting area, high-speed Wi-Fi, and farm views.", pricePerDay: 300, imageName: "executive-barn-suite"),
        RentalSpace(name: "Conference Lodge", description: "A fully equipped conference space with AV technology, seating for 20, and a cozy fireplace.", pricePerDay: 250, imageName: "conference-lodge"),
        RentalSpace(name: "Farmhouse Boardroom", description: "A charming farmhouse-style boardroom with a large table, whiteboard, and scenic views", pricePerDay: 200, imageName: "farmhouse")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text("Book a Space")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            // Date Picker
            DatePicker("Select Booking Date", selection: $selectedDate, displayedComponents: .date)
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
            
            // List of Rental Spaces
            Text("Available Spaces")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            List(rentalSpaces) { space in
                RentalSpaceRow(space: space, isSelected: selectedSpace?.id == space.id)
                    .onTapGesture {
                        selectedSpace = space
                    }
            }
            .listStyle(PlainListStyle())
            
            // Booking Button
            Button(action: {
                if selectedSpace != nil {
                    showingConfirmation = true
                }
            }) {
                Text("Book Now")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedSpace == nil ? Color.gray : Color.green)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .disabled(selectedSpace == nil)
            .padding()
        }
        .padding()
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Confirm Booking"),
                message: Text("Are you sure you want to book \(selectedSpace?.name ?? "") on \(formattedDate(selectedDate))?"),
                primaryButton: .default(Text("Confirm")) {
                    // Handle booking confirmation (e.g., send to backend)
                    print("Booking confirmed for \(selectedSpace?.name ?? "") on \(formattedDate(selectedDate))")
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    // Helper function to format the date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct RentalSpaceRow: View {
    let space: RentalSpace
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Image(space.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(space.name)
                    .font(.headline)
                Text(space.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("$\(String(format: "%.2f", space.pricePerDay)) / day")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            
            Spacer()
        }
        .padding()
        .background(isSelected ? Color.blue.opacity(0.1) : Color(.systemBackground))
        .cornerRadius(10)
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
