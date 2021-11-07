//
//  AuxSystemsMonitorBottom.swift
//  LCARS-SwiftUIJam
//
//  Created by Sebastien Boisvert on 2021-11-07.
//

import SwiftUI

struct AuxSystemsMonitorBottom: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 0) {

                    let bannerHeight = 22.0

                    Corner(columnWidth: 180, bannerHeight: bannerHeight,
                           color: Color(.brown), orientation: .topLeft)
                    Rectangle().fill(Color(.brown))
                        .frame(width: nil, height: bannerHeight, alignment: .topLeading)
                    HStack(alignment: .bottom, spacing: 5) {
                        RectangleGen(color: Color("RosePink"), height: bannerHeight, width: 50)
                        Rectangle().fill(.orange).frame(width: 150, height: bannerHeight/2, alignment: .top)
                            .padding(.bottom, bannerHeight/2)
                        RectangleGen(color: Color("LightPink"),height: bannerHeight, width: 250)
                        RectangleGen(color: Color("RosePink"), height: bannerHeight, width: 50)
                    } // Top corner bar
                    .padding(.leading, 5)
                }
            } // Top banner
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    RectangleGen(color: Color(.brown), title: "02-24156", height: 70, width: 180, alignment: .bottomTrailing)
                    RectangleGen(color: Color(.brown), title: "03-41248", height: 170, width: 180, alignment: .bottomTrailing)
                    RectangleGen(color: Color(.orange), title: "04-14702", height: 60, width: 180, alignment: .bottomTrailing)
                    RectangleGen(color: Color("LightOrange"), title: "05-32456", height: .infinity, width: 180, alignment: .topTrailing)
                } // Left Sidebar

                AnimatedGridView(animationStyle: .fullscreen)
                    .padding(.leading, 20)

            } // bottom content (below banner)
        }
        .frame(minWidth: .zero,
               idealWidth: nil,
               maxWidth: .infinity)
        .background(Color.black)
    }
}

struct AuxSystemsMonitorBottom_Previews: PreviewProvider {
    static var previews: some View {
        AuxSystemsMonitorBottom()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
