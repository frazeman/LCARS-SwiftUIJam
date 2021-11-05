//
//  Capsule.swift
//  LCARS-SwiftUIJam
//
//  Created by Sebastien Boisvert on 2021-11-05.
//

import SwiftUI

struct Capsule: View {

    public enum Orientation {
        case left
        case right
    }

    var color: Color = .orange
    var height: Double = 50.0
    var orientation : Orientation = .left

    var body: some View {
        SwiftUI.Capsule(style: .circular)
            .size(width: height*2, height: height)
            .frame(width: height*1.20, height: height, alignment: .leading)
            .clipped()
            .foregroundColor(.orange)
            .rotationEffect(Angle(degrees: (orientation == .right ? 180 : 0.0)))
    }
}

struct Capsule_Previews: PreviewProvider {
    static var previews: some View {
        Capsule(color: .purple, height: 50, orientation: .left)
    }
}
