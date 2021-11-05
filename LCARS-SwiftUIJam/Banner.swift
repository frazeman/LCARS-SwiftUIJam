//
//  Banner.swift
//  LCARS-SwiftUIJam
//
//  Created by Sebastien Boisvert on 2021-11-05.
//

import SwiftUI

struct Banner: View {

    var color : Color = .orange
    var height : Double = 50
    var capsuleColor : Color?

    var body: some View {
        let chosenCapsuleColor = capsuleColor ?? color
        HStack(alignment: .center, spacing: 5.0) {
            Capsule(color: chosenCapsuleColor, height: height, orientation: .left)
        Rectangle()
            .frame(width: nil, height: height, alignment: .center)
            .foregroundColor(color)
            Capsule(color: chosenCapsuleColor, height: height, orientation: .right)

        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(color: .purple, height: 40, capsuleColor: .orange)
    }
}
