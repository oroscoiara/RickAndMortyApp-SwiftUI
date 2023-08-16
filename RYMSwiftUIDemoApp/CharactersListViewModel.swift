//
//  CharactersListViewModel.swift
//  RYMSwiftUIDemoApp
//
//  Created by Iara Denise Orosco on 14/08/2023.
//

import Foundation
import RickMortySwiftApi

class CharacterListViewModel: ObservableObject {
    @Published var characters: [RickMortySwiftApi.RMCharacterModel] = []
    let client: RMClient

    public init(client: RMClient) {self.client = client}

    func fetchAllCharacters() async {
        do {
            let allCharacters = try await RMCharacter(client: client).getAllCharacters()
            DispatchQueue.main.async {
                self.characters = allCharacters
            }
        } catch {
            print("Error fetching characters: \(error)")
        }
    }
}

