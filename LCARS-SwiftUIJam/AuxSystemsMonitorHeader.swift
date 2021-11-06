//
//  AuxSystemsMonitorHeader.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct AuxSystemsMonitorHeader: View {
    var body: some View {
        HStack {
            VStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 100, height: 100)
            } // Main Header Left Section
            VStack(alignment: .trailing) {
                Text("AUXILIARY SYSTEMS MONITOR 882")
                    .font(Font.LCARS.title)
                    .foregroundColor(.orange)                    .multilineTextAlignment(.trailing)
                HStack {
                    Text("Fraser's data goes here")
                        .foregroundColor(.blue)
                    VStack {
                        CapsuleButtons(setColor: Color("LightPurple"), setDisplayText: "07-3215")
                        CapsuleButtons(setColor: Color("LightPink"), setDisplayText: "09-2548")
                    } // Button Stack 1
                    VStack {
                        CapsuleButtons(setColor: Color("LightOrange"), setDisplayText: "QUIT")
                        CapsuleButtons(setColor: Color("LightOrange"), setDisplayText: "10-6215")
                    } // Button Stack 2
                } // Main Headers Data Section
                
            } // Main Header Right Section
        
        } // Main Header Section
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
    }
}
