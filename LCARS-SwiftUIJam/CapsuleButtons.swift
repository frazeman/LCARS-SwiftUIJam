//
//  CapsuleButtons.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct CapsuleButtons: View {
    
    var color: Color = Color.red
    var title: String = "01-2345"
    
    
    var body: some View {
    
        ZStack (alignment: .bottomTrailing) {
            SwiftUI.Capsule()
                .fill(color)
            Text(title.uppercased())
                .font(Font.LCARS.headline)
                .foregroundColor(.black)
                .padding(.trailing, 30)
                .padding(.bottom, 5)
        }
        .frame(width: 200, height: 80)
    }
}


struct LcarsButtonStyle: ButtonStyle {
    var color: Color = .orange
    var width: CGFloat = 200
    var height: CGFloat = 60

    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack (alignment: .bottomTrailing) {
            SwiftUI.Capsule()
                .fill(color)

            SwiftUI.Capsule()
                .fill(configuration.isPressed ? Color.white.opacity(0.65) : .clear)

            configuration.label
                .font(Font.LCARS.headline)
                .foregroundColor(.black)
                .padding(.trailing, 30)
                .padding(.bottom, 5)
        }
        .frame(width: width, height: height)
    }
}


struct CapsuleButtons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CapsuleButtons()
            Button("ACCESS") {}
            .buttonStyle(LcarsButtonStyle())
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
