//
//  Sounds.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-06.
//

import Foundation
import AVKit

enum Sound: String {
    case SingleBeep = "Single Beep"
    case DoubleBeep = "Two Beep"
}

class SoundManager {
    static let shared = SoundManager()

    var enabled: Bool = false

    private var players: [AVAudioPlayer] = []

    func play(_ sound: Sound) {
        guard enabled else { return }

        if let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "wav") {
            self.play(url)
        }
    }

    private func play(_ url: URL) {
        if let player = try? AVAudioPlayer(contentsOf: url) {
            self.players.append(player)
            player.play()
        }

        self.players = self.players.filter { $0.isPlaying }
    }

}
