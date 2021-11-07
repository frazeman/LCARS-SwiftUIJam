//
//  AuxSystemsMonitorHeader.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct AuxSystemsMonitorHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                RectangleGen(color: .orange, title: "LCARS 23295", alignment: .bottomTrailing)
                RectangleGen(color: Color("LightPurple"), title: "01-23584", alignment: .topTrailing)

            } // Main Header Left Section
            VStack(alignment: .trailing) {
                Text("AUXILIARY SYSTEMS MONITOR 882")
                    .font(Font.LCARS.title)
                    .foregroundColor(.orange)                    .multilineTextAlignment(.trailing)
                HStack  {
                    AnimatedGridView()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        CapsuleButtons(color: Color("LightPurple"), title: "07-3215")
                        CapsuleButtons(color: Color("LightPink"), title: "09-2548")
                    } // Button Stack 1
                    VStack(alignment: .trailing) {
                        CapsuleButtons(color: Color("LightOrange"), title: "QUIT")
                        CapsuleButtons(color: Color("LightOrange"), title: "10-6215")
                    } // Button Stack 2
                } // Main Headers Data Section
                
            } // Main Header Right Section
        
        } // Main Header Section
            HStack(alignment: .bottom, spacing: 0) { 
                Corner(columnWidth: 180, bannerHeight: 15,
                       color: Color("LightPurple"), orientation: .bottomLeft)
                Rectangle().fill(Color("LightPurple"))
                    .frame(width: nil, height: 15, alignment: .bottom)
            }

        }
        .padding()
            .frame(
                minWidth: .zero,
                maxWidth: .infinity,
                minHeight: .zero,
                maxHeight: .infinity
            )
            .background(Color.black)
    }
}

struct AuxSystemsMonitorHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuxSystemsMonitorHeader()
            .previewInterfaceOrientation(.landscapeRight)

    }
}
