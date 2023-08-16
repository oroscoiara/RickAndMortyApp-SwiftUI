//
//  CharacterListView.swift
//  RYMSwiftUIDemoApp
//
//  Created by Iara Denise Orosco on 14/08/2023.
//

import SwiftUI
import RickMortySwiftApi

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterListViewModel(client: RMClient())
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            List(viewModel.characters, id: \.id) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    CharacterRowView(character: character, characterStatus: CharacterStatus(rawValue: character.status) ?? .unknown)
                }
            }
            .onAppear {
                if isLoading {
                    Task {
                        await viewModel.fetchAllCharacters()
                        isLoading = false
                    }
                }
            }
            .navigationBarTitle("Characters", displayMode: .inline)
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
