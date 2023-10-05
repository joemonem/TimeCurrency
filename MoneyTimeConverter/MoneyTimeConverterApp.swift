//
//  MoneyTimeConverterApp.swift
//  MoneyTimeConverter
//
//  Created by Joe Monem on 03/10/2023.
//

import SwiftUI

@main
struct MoneyTimeConverterApp: App {
    @StateObject private var store = UserStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ContentView(user: $store.user) {
                Task {
                    do {
                        try await store.save(user: store.user)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }.task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.user = User.sampleUser
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}

