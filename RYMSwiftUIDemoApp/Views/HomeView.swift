//
//  HomeView.swift
//  RYMSwiftUIDemoApp
//
//  Created by Iara Denise Orosco on 14/08/2023.
//

import RickMortySwiftApi
import SwiftUI
import Alamofire
import Kingfisher


struct HomePage: View {
    @Binding var selectedTab: Int
    @State private var character: RMCharacterModel? 
    let characterID = 1

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Welcome to the")
                .lineLimit(1)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(.secondaryLabel))

            Text("Rick and Morty World")
                .lineLimit(1)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color(.secondaryLabel))

            if let imageURLString = character?.image,
               let imageURL = URL(string: imageURLString) {
                KFImage(imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle(tabName(for: selectedTab), displayMode: .inline)
        .onAppear {
            fetchCharacter()
        }
    }

    func fetchCharacter() {
        let apiURL = "https://rickandmortyapi.com/api/character/\(characterID)"

        AF.request(apiURL).responseDecodable(of: RMCharacterModel.self) { response in
            switch response.result {
            case .success(let character):
                self.character = character
            case .failure(let error):
                print("Error fetching character: \(error)")
            }
        }
    }

    func tabName(for index: Int) -> String {
        switch index {
        case 0:
            return "Home"
        case 1:
            return "Characters"
        default:
            return "Characters"
        }
    }
}

struct HomeView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedTab) {
                    HomePage(selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)

                    CharacterListView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("Characters")
                        }
                        .tag(1)

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
