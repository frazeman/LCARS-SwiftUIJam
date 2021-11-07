//
//  AuxSystemsMonitorMain.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct AuxSystemsMonitorMain: View {
    var body: some View {
    
        HStack {
            AuxSystemsMonitorHeader()
//            AuxSystemsMonitorBottom()
        }
        .frame(minWidth: .zero,
               idealWidth: .infinity,
               maxWidth: .infinity,
               minHeight: .zero,
               idealHeight: .infinity,
               maxHeight: .infinity,
               alignment: .top)
        .background(.black)
    }
}

struct AuxSystemsMonitorMain_Previews: PreviewProvider {
    static var previews: some View {
        AuxSystemsMonitorMain()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
