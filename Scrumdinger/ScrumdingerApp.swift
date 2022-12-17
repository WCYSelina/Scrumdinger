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
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $store.scrums){
//                    ScrumStore.save(scrums:store.scrums){result in
//                        if case .failure(let error) = result{
//                            fatalError(error.localizedDescription)
//                        }
//                    }
                    Task{
                        do{
                            try await ScrumStore.save(scrums: store.scrums)
                        }catch{
//                            fatalError("Error saving scrums.")
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
            }
//            .onAppear{
//                ScrumStore.load{result in
//                    switch result{
//                    case .failure(let error):
//                        fatalError(error.localizedDescription)
//                    case .success(let scrums):
//                        store.scrums = scrums
//                    }
//                }
//            }
            //task modifier, to execute an asynchronous function when a view appear
            .task{
                do{
                    store.scrums = try await ScrumStore.load()
                }catch{
//                    fatalError("Error loading scrums.")
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                store.scrums = DailyScrum.sampleDaTA
            }){ wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
