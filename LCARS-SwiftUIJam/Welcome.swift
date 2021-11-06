//
//  Welcome.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-05.
//

import SwiftUI

struct Welcome: View {
    var buttonTapped: (() -> Void)? = nil

    @State private var showImage: Bool = true
    @State private var showTitle: Bool = true
    @State private var showSubtitle: Bool = true
    @State private var showButton: Bool = false

    var body: some View {
        VStack {
            Banner(title: "Console 21")

            Spacer()

            Image("Logo")
                .opacity(showImage ? 1 : 0)

            Text("THE LCARS COMPUTER NETWORK")
                .font(Font.LCARS.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.orange)
                .opacity(showTitle ? 1 : 0)

            Group {
                Text("AUTHORIZED ACCESS ONLY")
                Text("PLEASE REPORT MALFUNCTIONS TO ENGINEERING STAFF ON DUTY")
            }
            .font(Font.LCARS.header)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("LightPurple"))
            .opacity(showSubtitle ? 1 : 0)

            Button("Access".uppercased()) {
                SoundManager.shared.play(.SingleBeep)
                buttonTapped?()
            }
            .buttonStyle(LcarsButtonStyle())
            .opacity(showButton ? 1 : 0)

            Spacer()

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
        .onAppear {
            self.animate()
        }
    }

    private func animate() {
        let sequence = AnimationSequence(duration: 0.01)

        self.showImage = false
        self.showTitle = false
        self.showSubtitle = false

        // Blink image
        sequence
            .append(delay: 1, sound: .SingleBeep) {
                showImage = true
            }
            .append(delay: 0.1) {
                showImage = false
            }
            .append(delay: 0.1) {
                showImage = true
            }
            .append(delay: 0.1) {
                showImage = false
            }
            .append(delay: 0.1, sound: .SingleBeep) {
                showImage = true
            }

        sequence
            .append(delay: 0.5, sound: .DoubleBeep) {
                showTitle = true
            }

        sequence
            .append(delay: 0.1) {
                showSubtitle = true
            }

        sequence
            .append(delay: 0.3) {
                showButton = true
            }
            .append(delay: 0.1) {
                showButton = false
            }
            .append(delay: 0.1) {
                showButton = true
            }

        sequence
            .start()
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
            .previewLayout(.fixed(width: 900, height: 700))
    }
}
