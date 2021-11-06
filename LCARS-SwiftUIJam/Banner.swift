//
//  Banner.swift
//  LCARS-SwiftUIJam
//
//  Created by Sebastien Boisvert on 2021-11-05.
//

import SwiftUI

struct Banner: View {
    var title: String? = nil
    var height: Double = 32

    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Capsule(color: title == nil ? .orange : Color("LightPurple"), height: height, orientation: .left)
            
            if let title = title {
                Text(title.uppercased())
                    .font(Font.LCARS.header)
                    .lineLimit(1)
                    .foregroundColor(.orange)
            }
            
            Rectangle()
                .frame(width: nil, height: height, alignment: .center)
                .foregroundColor(Color("LightPurple"))

            Capsule(color: .orange, height: height, orientation: .right)
        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Banner(title: UIDevice.current.name)
            Banner()
        }
        .padding()
        .frame(
            minWidth: .zero,
            maxWidth: .infinity,
            minHeight: .zero,
            maxHeight: .infinity
        )
        .background(Color.black)
        .previewLayout(.fixed(width: 800, height: 200))
    }
}
