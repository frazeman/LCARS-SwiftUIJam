//
//  AuxSystemsMonitorHeader.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct AuxSystemsMonitorHeader: View {
    var quitTapped: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 5) {
                    RectangleGen(color: .orange, title: "LCARS 23295", alignment: .bottomTrailing)
                    RectangleGen(color: Color("LightPurple"), title: "01-23584", alignment: .topTrailing)
                } // Main Header Left Section
                Spacer()
                VStack(alignment: .trailing) {
                        VStack(alignment: .trailing) {
                            Text("AUXILIARY SYSTEMS MONITOR 882")
                                .font(Font.LCARS.title)
                                .foregroundColor(.orange)
                                .multilineTextAlignment(.trailing)
                            HStack {
                                AnimatedGridView()
                                    .frame(height: 170)
                                    .padding(.leading, 20)
                                VStack(alignment: .trailing) {
                                    CapsuleButtons(color: Color("LightPurple"), title: "07-3215")
                                    CapsuleButtons(color: Color("LightPink"), title: "09-2548")
                                } // Button Stack 1
                                VStack(alignment: .trailing) {
//                                    CapsuleButtons(color: Color("LightOrange"), title: "QUIT")
                                    Button("QUIT".uppercased()) {
                                        SoundManager.shared.play(.SingleBeep)
                                        quitTapped?()
                                    }
                                    .buttonStyle(LcarsButtonStyle())

                                    CapsuleButtons(color: Color("LightOrange"), title: "10-6215")
                                } // Button Stack 2
                            } // Main Headers Data Section
                        }
                }// Main Header Right Section

            } // Main Header Section
            HStack(alignment: .bottom, spacing: 0) {

                let bannerHeight = 22.0
                
                Corner(columnWidth: 180, bannerHeight: bannerHeight,
                       color: Color("LightPurple"), orientation: .bottomLeft)
                Rectangle().fill(Color("LightPurple"))
                    .frame(width: nil, height: bannerHeight, alignment: .topLeading)
                HStack(alignment: .bottom, spacing: 5) {
                    RectangleGen(color: Color("RosePink"), height: bannerHeight, width: 50)
                    RectangleGen(color: .orange, height: bannerHeight, width: 150)
                        RectangleGen(color: Color("LightPink"),height: bannerHeight, width: 250)
                    RectangleGen(color: Color("RosePink"), height: bannerHeight, width: 50)
                    }
                    .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 0.0))
            }
        }
        .frame(minWidth: .zero,
               idealWidth: .infinity,
               maxWidth: .infinity)
        .background(Color.black)
    }
}

struct AuxSystemsMonitorHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuxSystemsMonitorHeader()
            AuxSystemsMonitorHeader()
                .previewInterfaceOrientation(.landscapeLeft)
        }

    }
}
