//
//  AlbumImageView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import SwiftUI
import Kingfisher

struct AlbumImageView: View {
    let imageUrl : String
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable().aspectRatio(contentMode: .fill)
            .scaledToFill()
            .frame(width: WidthSize.lowImageWidth,
                   height: HeightSize.lowImgHeight)
            .clipped()
    }
}

struct AlbumImageView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImageView(imageUrl: "https://picsum.photos/200/300")
    }
}
