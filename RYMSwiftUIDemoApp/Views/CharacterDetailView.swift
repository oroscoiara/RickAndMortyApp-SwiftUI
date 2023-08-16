//
//  CharacterDetailView.swift
//  RYMSwiftUIDemoApp
//
//  Created by Iara Denise Orosco on 14/08/2023.
//

import SwiftUI
import RickMortySwiftApi
import Kingfisher

struct CharacterDetailView: View {
    let character: RMCharacterModel

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                KFImage(URL(string: character.image))
                    .resizable()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())

                Text(character.name)
                    .font(.title)
                    .bold()

                Text("Status: \(character.status)")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 8) {

                    Text("Origin: ")
                        .font(.headline)

                    Text(character.origin.name)
                        .font(.subheadline)
                        .foregroundColor(.blue)

                    Text("Specie: ")
                        .font(.headline)

                    Text(character.species)
                        .font(.subheadline)
                        .foregroundColor(.blue)

                    Text("Gender: ")
                        .font(.headline)

                    Text(character.gender)
                        .font(.subheadline)
                        .foregroundColor(.blue)

                    Text("Episodes:")
                        .font(.headline)
                    ForEach(character.episode, id: \.self) { episodeURL in
                        Text(episodeURL)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                if let episodeURL = URL(string: episodeURL) {
                                    //to be done
                                }
                            }
                    }

                }

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(character.name, displayMode: .inline)
    }
}
