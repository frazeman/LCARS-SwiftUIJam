//
//  AnimationSequence.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-06.
//

import Foundation
import SwiftUI

// Adapted from https://github.com/cristhianleonli/AnimationSequence

class AnimationSequence {
    private var animations: [AnimationConfiguration] = []
    private var onFinishCallback: (() -> Void)?
    private var defaultConfig: AnimationConfiguration

    init(duration: Double = 0.1, delay: Double = 0) {
        self.defaultConfig = AnimationConfiguration(duration: duration, delay: delay, block: nil)
    }

    @discardableResult
    func append(duration: Double? = nil, delay: Double? = nil, sound: Sound? = nil, block: @escaping AnimationBlock) -> AnimationSequence {
        animations.append(
            AnimationConfiguration(
                duration: duration ?? defaultConfig.duration,
                delay: delay ?? defaultConfig.delay,
                sound: sound,
                block: block
            )
        )

        return self
    }

    @discardableResult
    func wait(for seconds: Double) -> AnimationSequence {
        append(duration: 0, delay: seconds, block: {})

        return self
    }

    @discardableResult
    func onFinish(callback: @escaping () -> Void) -> AnimationSequence {
        self.onFinishCallback = callback
        return self
    }

    func start() {
        var offsetTime: Double = 0

        for config in animations {

            offsetTime += config.delay

            withAnimation(Animation.easeInOut(duration: config.duration).delay(offsetTime)) {
                config.block?()
            }

            if let sound = config.sound {
                DispatchQueue.main.asyncAfter(deadline: .now() + offsetTime) {
                    SoundManager.shared.play(sound)
                }
            }

            offsetTime += config.duration
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + offsetTime) {
            self.onFinishCallback?()
        }
    }
}

typealias AnimationBlock = () -> Void

struct AnimationConfiguration {
    var duration: Double
    var delay: Double
    var sound: Sound?
    let block: AnimationBlock?
}
