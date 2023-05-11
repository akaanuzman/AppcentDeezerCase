//
//  ImageView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    let imageUrl : String
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: WidthSize.imageAndRectangleWidth,
                   height: HeightSize.imgHeight)
            .clipped()
            .cornerRadius(radius: CornerRadius.large,
                          corners: [.topLeft,.topRight])
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageUrl: "https://picsum.photos/200/300")
    }
}
