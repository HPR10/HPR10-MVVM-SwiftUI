//
//  MVVM_SwiftUIApp.swift
//  MVVM SwiftUI
//
//  Created by Hugo Pinheiro on 13/12/21.
//

import SwiftUI

@main
struct MVVM_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            // injetando a viewModel em todo ambiente.
            .environmentObject(ContentViewModel())
        }
    }
}
