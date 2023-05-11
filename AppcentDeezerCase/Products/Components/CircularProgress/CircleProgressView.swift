//
//  CircleProgressView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import SwiftUI

struct CircleProgressView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .pink))
            Title3BoldPinkText(title: LocaleKeys.loading.locale())
        }
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView()
    }
}
