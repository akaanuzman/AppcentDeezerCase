//
//  Title3BoldPinkText.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 9.05.2023.
//

import SwiftUI

struct Title3BoldPinkText: View {
    let title : LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .foregroundColor(.pink)
            .bold()
            .padding()
    }
}

struct Title3BoldPinkText_Previews: PreviewProvider {
    static var previews: some View {
        Title3BoldPinkText(title: "data")
    }
}
