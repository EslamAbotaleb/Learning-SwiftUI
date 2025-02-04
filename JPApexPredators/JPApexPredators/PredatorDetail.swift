//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Eslam on 02/02/2025.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator

    var body: some View {
        GeometryReader {
            geometry in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)

                    Text("Appears In:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) {
                        movie in
                        Text("." + movie)
                            .font(.subheadline)
                    }
                    Text("Movie Moments")
                        .font(.title3)
                        .padding(.top, 15)

                    ForEach(predator.movieScenes) {
                        scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)

                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    Text("Read More:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
                .padding()
                .padding(.bottom)
                .frame(width: geometry.size.width, alignment: .leading)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
        .preferredColorScheme(.dark)
}
