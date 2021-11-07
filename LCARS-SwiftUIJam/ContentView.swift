//
//  ContentView.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-05.
//

import SwiftUI

struct ContentView: View {
    @State private var currentView: LCARSView = .welcome

    enum LCARSView {
        case welcome
        case auxSystemsMonitor
    }

    var body: some View {
        switch currentView {
        case .welcome:
            Welcome(buttonTapped: { self.currentView = .auxSystemsMonitor })
        case .auxSystemsMonitor:
                AuxSystemsMonitorMain(quitTapped: { self.currentView = .welcome })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
