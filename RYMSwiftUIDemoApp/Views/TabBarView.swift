//
//  TabBarView.swift
//  RYMSwiftUIDemoApp
//
//  Created by Iara Denise Orosco on 14/08/2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomePage(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            CharacterListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Characters")
                }
        }
        .accentColor(.purple)
    }
}



struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
