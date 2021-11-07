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
                           color: .brown, orientation: .topLeft)
                    Rectangle().fill(.brown)
                        .frame(width: nil, height: bannerHeight, alignment: .topLeading)
                    HStack(alignment: .bottom, spacing: 5) {
                        RectangleGen(color: Color("RosePink"), height: bannerHeight, width: 50)
                        Rectangle().fill(.orange).frame(width: 150, height: bannerHeight/2, alignment: .top)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: bannerHeight/2, trailing: 0))
                        RectangleGen(color: Color("LightPink"),height: bannerHeight, width: 250)
                        RectangleGen(color: Color("RosePink"), height: bannerHeight, width: 50)
                    } // Top corner bar
                    .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 0.0))
                }
                RectangleGen(color: Color(.brown), title: "02-24156", height: 70, width: 180, alignment: .bottomTrailing)
            } // Top banner
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    RectangleGen(color: Color(.brown), title: "03-41248", height: 170, width: 180, alignment: .bottomTrailing)
                    RectangleGen(color: Color(.orange), title: "04-14702", height: 60, width: 180, alignment: .bottomTrailing)
                    RectangleGen(color: Color("LightOrange"), title: "05-32456", height: .infinity, width: 180, alignment: .topTrailing)
                } // Left Sidebar
                .padding(EdgeInsets(top: 5.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                
                Text("Number grid")
                    .foregroundColor(.blue)
                    .frame(width: .infinity, height: .infinity, alignment: .center)

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
