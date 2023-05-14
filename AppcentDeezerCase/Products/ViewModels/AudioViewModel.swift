//
//  AudioViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 14.05.2023.
//

import AVFoundation
import Foundation

class AudioViewModel: ObservableObject {
    @Published var player: AVPlayer?
    @Published var isStart: Bool = true

    func playMusic(song: String) {
        guard let url = URL(string: song) else {
            print("Resource not found: \(song)")
            return
        }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        if isStart {
            player?.play()
        } else {
            player?.pause()
        }
        isStart.toggle()
    }
}
