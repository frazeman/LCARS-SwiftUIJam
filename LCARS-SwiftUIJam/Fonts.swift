//
//  Fonts.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-05.
//

import Foundation
import SwiftUI

extension Font {

    struct LCARS {
        static let title = Font.custom(Swiss911.ultraCompressed, size: 54)
        static let headline = Font.custom(Swiss911.ultraCompressed, size: 26)
        static let data = Font.custom(Swiss911.ultraCompressed, size: 22)
        static let header = Font.custom(Swiss911.ultraCompressed, size: 40)
    }

    fileprivate struct Swiss911 {
        static let ultraCompressed = "Swiss911BT-UltraCompressed"
    }
}
