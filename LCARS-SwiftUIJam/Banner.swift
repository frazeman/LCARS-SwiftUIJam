//
//  Banner.swift
//  LCARS-SwiftUIJam
//
//  Created by Sebastien Boisvert on 2021-11-05.
//

import SwiftUI

struct Banner: View {

    var bottomBar : Bool = false
    var height : Double = 50

    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            Capsule(color: bottomBar ? .orange : Color("LightPurple"), height: height, orientation: .left)
        Rectangle()
            .frame(width: nil, height: height, alignment: .center)
            .foregroundColor(Color("LightPurple"))
            Capsule(color: .orange, height: height, orientation: .right)

        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(bottomBar: false, height: 40)
    }
}
