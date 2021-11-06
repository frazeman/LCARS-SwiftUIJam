//
//  RectangleGen.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct RectangleGen: View {
    
    var setColor: Color = Color.orange
    var setDisplayText: String = "LCARS 23295"
    var height: Double = 130
    var width: Double = 180
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            Rectangle()
                .fill(setColor)
            Text(setDisplayText.uppercased())
                .font(Font.LCARS.headline)
                .padding(.trailing, 15)
                .padding(.bottom, 5)
        }
        .frame(width: width, height: height)
    }
}

struct RectangleGen_Previews: PreviewProvider {
    static var previews: some View {
        RectangleGen()
    }
}
