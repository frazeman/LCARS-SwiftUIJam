//
//  AuxSystemsMonitorMain.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct AuxSystemsMonitorMain: View {
    var body: some View {
    
        VStack {
            AuxSystemsMonitorHeader()
            AuxSystemsMonitorBottom()
        }
        .padding()
        .frame(minWidth: .zero,
               idealWidth: .infinity,
               maxWidth: .infinity)
        .background(Color.black)
    }
}

struct AuxSystemsMonitorMain_Previews: PreviewProvider {
    static var previews: some View {
        AuxSystemsMonitorMain()
.previewInterfaceOrientation(.landscapeRight)

    }
}
