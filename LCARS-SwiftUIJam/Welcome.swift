//
//  Welcome.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-05.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            Text("THE LCARS COMPUTER NETWORK")
                .font(.title.weight(.semibold))
                .foregroundColor(.orange)
        }
        .frame(
            minWidth: .zero,
            maxWidth: .infinity,
            minHeight: .zero,
            maxHeight: .infinity
        )
        .background(Color.black)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
            .previewLayout(.fixed(width: 800, height: 600))
    }
}
