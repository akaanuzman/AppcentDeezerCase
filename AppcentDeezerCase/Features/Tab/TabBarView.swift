//
//  TabBarView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: TabEnum = .musicNote

    init() {
        // hides the bottom blank white tabbar
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                CategoryView().tag(TabEnum.musicNote)
                FavoriteListView().tag(TabEnum.heartFill)
            }
            VStack {
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
