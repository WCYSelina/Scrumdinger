//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ching Yee Selina Wong on 13/11/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
//    @State private var scrums = DailyScrum.sampleDaTA
    @StateObject private var store = ScrumStore()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $store.scrums){
                    ScrumStore.save(scrums:store.scrums){result in
                        if case .failure(let error) = result{
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear{
                ScrumStore.load{result in
                    switch result{
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
