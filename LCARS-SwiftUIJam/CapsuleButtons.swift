//
//  CapsuleButtons.swift
//  LCARS-SwiftUIJam
//
//  Created by Sean Mendonca on 2021-11-06.
//

import SwiftUI

struct CapsuleButtons: View {
    
    var setColor: Color = Color.red
    var setDisplayText: String = "01-2345"
    
    
    var body: some View {
    
        ZStack {
            SwiftUI.Capsule()
                .fill(setColor)
                .frame(width: 225, height: 100)
            Text(setDisplayText)
                .frame(width: 150, height: 75, alignment: .bottomTrailing)
                .font(Font.LCARS.header)
        }
    }
}

struct CapsuleButtons_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButtons()
    }
}
