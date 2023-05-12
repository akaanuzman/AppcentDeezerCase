//
//  TabBarView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: TabEnum
    
    func getScale(tab: TabEnum) -> Double {
        selectedTab == tab ? ScaleConstants.low : ScaleConstants.xLow
    }
    
    func getFont(tab: TabEnum) -> Font {
        selectedTab == tab ? .largeTitle : .title
    }
    
    func getBgColor(tab: TabEnum) -> Color {
        selectedTab == tab ? .white : .gray
    }
    
    func selectTab(tab: TabEnum) {
        withAnimation(.easeIn(duration: DurationConstants.low)) {
            selectedTab = tab
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(TabEnum.allCases, id: \.rawValue) { tab in
                    Spacer()
                    tabImage(tab: tab)
                    Spacer()
                }
            }.frame(height: HeightSize.tabHeight)
                .background(.pink)
                .cornerRadius(CornerRadius.large)
                .padding()
        }
    }
    
    func tabImage(tab: TabEnum) -> some View {
        Image(systemName: tab.rawValue)
            .scaleEffect(getScale(tab: tab))
            .font(getFont(tab: tab))
            .foregroundColor(getBgColor(tab: tab))
            .onTapGesture {
                selectTab(tab: tab)
            }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(selectedTab: .constant(.heartFill))
    }
}
