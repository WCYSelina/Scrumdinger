//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ching Yee Selina Wong on 13/11/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: DailyScrum.sampleDaTA)
            }
        }
    }
}
