//
//  PhotoGallery.swift
//  SummersWellnessFarm
//
//  Created by Grace Beard on 3/11/25.
//

import SwiftUI

struct FullScreenImageData: Identifiable {
    var id: String { area + "_" + String(index) }
    let area: String
    var index: Int
}

struct ResortPhotoGallery: View {
    @State private var selectedArea: String = "Outdoors"
    @State private var fullScreenData: FullScreenImageData? = nil
    
    @State private var areas = [
        "Outdoors": ["outdoor1", "outdoor2", "outdoor3"],
        "Farm": ["farm1","farm2","farm3"],
        "Garden": ["garden1","garden2","garden3"],
        "Barn": ["download-1", "download 2", "barn2","barn3"],
        "Ballroom": ["ChapelFarm", "download-6", "download-8"],
        "All": ["outdoor1", "outdoor2", "outdoor3", "farm1","farm2","farm3", "garden1","garden2","garden3", "download-1", "download 2", "barn2","barn3", "ChapelFarm", "download-6", "download-8"]
    ]
    
    var body: some View {
        VStack {
            Text("Resort Photo Gallery")
                .font(.custom("AvenirNext-Bold", size: 34))
                .foregroundColor(Color(red: 59/255, green: 41/255, blue: 30/255).opacity(0.85))
                .padding()
            
            Picker("Select Area", selection: $selectedArea) {
                ForEach(areas.keys.sorted(), id: \.self) { area in
                    Text(area).tag(area)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach(areas[selectedArea] ?? [], id: \.self) { imageName in
                        Button(action: {
                            if let images = areas[selectedArea],
                               let index = images.firstIndex(of: imageName) {
                                fullScreenData = FullScreenImageData(area: selectedArea, index: index)
                            }
                        }) {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Explore the Resort")
        .sheet(item: $fullScreenData) { data in
            if let images = areas[data.area] {
                FullScreenImageView(images: images, currentIndex: Binding(
                    get: { data.index },
                    set: { newIndex in
                        fullScreenData?.index = newIndex
                    }
                ), onDismiss: {
                    fullScreenData = nil
                })
            } else {
                Text("No images available")
            }
        }
    }
}

struct FullScreenImageView: View {
    let images: [String]
    @Binding var currentIndex: Int
    let onDismiss: () -> Void

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Spacer()
                Image(images[currentIndex])
                    .resizable()
                    .scaledToFit()
//                    .padding()
                Spacer()
                HStack {
                    Button(action: {
                        currentIndex = (currentIndex - 1 + images.count) % images.count
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button(action: {
                        currentIndex = (currentIndex + 1) % images.count
                    }) {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 40)
                Button("Dismiss") {
                    onDismiss()
                }
                .modifier(CustomButtonStyle())
                .padding(.top, 20)
            }
        }
        .padding()
    }
}


#Preview {
    ResortPhotoGallery()
}
