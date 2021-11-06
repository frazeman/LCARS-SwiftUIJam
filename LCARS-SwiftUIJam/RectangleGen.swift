//
//  RectangleGen.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct RectangleGen: View {
    
    var color: Color = Color.orange
    var title: String? = nil
    var height: Double = 130
    var width: Double = 180
    var alignment: Alignment = .bottomTrailing
    
    var body: some View {
        ZStack (alignment: alignment) {
            Rectangle()
                .fill(color)
            if let title = title {
                Text(title.uppercased())
                    .font(Font.LCARS.headline)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
            }
        }
        .frame(width: width, height: height)
    }
}

struct RectangleGen_Previews: PreviewProvider {
    static var previews: some View {
        RectangleGen(title: "LCARS 32145")
    }
}
