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

    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            Circle()
                .trim(from: 0.5, to: 1.0)
                .rotation(Angle(degrees: -90))
                .frame(width: height, height: height, alignment: .leading)
                .frame(width: height/2, height: height, alignment: .leading)
                .foregroundColor(color)

        Rectangle()
            .frame(width: nil, height: height, alignment: .center)
            .foregroundColor(color)

            Circle()
                .trim(from: 0.5, to: 1.0)
                .rotation(Angle(degrees: 90))
                .frame(width: height, height: height, alignment: .trailing)
                .frame(width: height/2, height: height, alignment: .trailing)
                .foregroundColor(color)

        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(color: .purple, height: 40)
    }
}
