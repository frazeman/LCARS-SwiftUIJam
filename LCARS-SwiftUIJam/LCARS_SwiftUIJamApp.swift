//
//  LCARS_SwiftUIJamApp.swift
//  LCARS-SwiftUIJam
//
//  Created by Fraser Kuyvenhoven on 2021-11-05.
//

import SwiftUI

@main
struct LCARS_SwiftUIJamApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    SoundManager.shared.enabled = true
                }
        }
    }
}
