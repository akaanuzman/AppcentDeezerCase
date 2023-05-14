//
//  AlbumImageView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import Kingfisher
import SwiftUI

struct AlbumImageView: View {
    let imageUrl: String
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable().aspectRatio(contentMode: .fill)
            .scaledToFill()
            .frame(width: WidthSize.lowImageWidth.rawValue,
                   height: HeightSize.lowImg.rawValue)
            .clipped()
    }
}

struct AlbumImageView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImageView(imageUrl: "https://picsum.photos/200/300")
    }
}
