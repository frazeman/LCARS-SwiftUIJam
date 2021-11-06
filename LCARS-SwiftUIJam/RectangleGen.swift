//
//  RectangleGen.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct RectangleGen: View {
    
    public enum PositionOfText {
        case top
        case bottom
    }
    
    var setColor: Color = Color.gray
    var setDisplayText: String = "LCARS300"
    var height: Double = 200
    var width: Double = 100
    var textPosition: PositionOfText = .bottom
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Rectangle()
                .fill(setColor)
            Text(setDisplayText.uppercased())
                .font(Font.LCARS.headline)
                .padding(.trailing, 30)
                .padding(.top, 5)
        }
        .frame(width: 200, height: 80)
    }
}

struct RectangleGen_Previews: PreviewProvider {
    static var previews: some View {
        RectangleGen()
    }
}
