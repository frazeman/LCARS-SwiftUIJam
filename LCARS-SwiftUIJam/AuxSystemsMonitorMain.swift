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
            VStack {
            
                HStack {
                    AuxSystemsMonitorHeader()
                }
                HStack {
                    Corner(effectiveWidth: 0.5, bannerHeight: 50, color: Color("LightPink"), orientation: .bottomLeft)
                        RectangleGen(color: Color("RosePink"), height: 50, width: 400)
                        RectangleGen(color: .orange, height: 50, width: 50)
                        RectangleGen(color: Color("LightPink"),height: 50, width: 200)
                        RectangleGen(color: Color("LightPink"),height: 50, width: 400)
                        RectangleGen(color: Color("RosePink"), height: 50, width: 100)
                }
            }
            VStack {
            
                
            }
        }
    }
    
}

struct AuxSystemsMonitorMain_Previews: PreviewProvider {
    static var previews: some View {
        AuxSystemsMonitorMain()
.previewInterfaceOrientation(.landscapeRight)
    }
}
