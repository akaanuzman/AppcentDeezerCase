//
//  ArtistImageView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import SwiftUI
import Kingfisher

struct ArtistImageView: View {
    let imageUrl : String
    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: HeightSize.imgHeight)
    }
}

struct ArtistImageView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistImageView(imageUrl: "https://picsum.photos/200/300")
    }
}
