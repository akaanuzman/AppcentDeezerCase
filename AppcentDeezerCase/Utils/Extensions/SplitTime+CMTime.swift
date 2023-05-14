//
//  SplitTime+CMTime.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 12.05.2023.
//

import AVFoundation
import Foundation

extension CMTime {
    ///  Rounds the seconds exp: Rounded value 3 for 3.10 seconds
    var roundedSeconds: TimeInterval {
        return seconds.rounded()
    }

    var hours: Int { return Int(roundedSeconds / 3600) }
    var minute: Int { return Int(roundedSeconds.truncatingRemainder(dividingBy: 3600) / 60) }
    var second: Int { return Int(roundedSeconds.truncatingRemainder(dividingBy: 60)) }
    var positionalTime: String {
        return hours > 0 ?
            String(format: "%d:%02d:%02d",
                   hours, minute, second) :
            String(format: "%02d:%02d",
                   minute, second)
    }
}
