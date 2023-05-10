//
//  RectangleImageView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI

struct RectangleImageView: View {
    let imageUrl : String
    let title : String
    var body: some View {
        ZStack {
            RoundedRectangleView()
            VStack {
                ImageView(imageUrl: imageUrl)
                Text(title)
                Spacer.spacer24x
            }
        }
    }
}

struct RectangleImageView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleImageView(imageUrl: "https://picsum.photos/200/300",
                           title: "deneme")
    }
}
