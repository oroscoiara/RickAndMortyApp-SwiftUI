//
//  CharacterRowView.swift
//  RYMSwiftUIDemoApp
//
//  Created by Iara Denise Orosco on 14/08/2023.
//
import SwiftUI
import RickMortySwiftApi
import Kingfisher

struct CharacterRowView: View {
    let character: RMCharacterModel
    let characterStatus: CharacterStatus

    var body: some View {

        HStack {
            KFImage(URL(string: character.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(20)

            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                HStack(spacing: 4) {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(circleColor)
                    Text(character.status)
                        .font(.subheadline)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
    }

    private var circleColor: Color {
        switch characterStatus {
        case .dead:
            return Color.red
        case .alive:
            return Color.green
        case .unknown:
            return Color.gray
        }
    }

}
enum CharacterStatus: String {
    case dead = "Dead"
    case alive = "Alive"
    case unknown = "Unknown"
}

