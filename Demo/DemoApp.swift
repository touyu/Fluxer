//
//  DemoApp.swift
//  Demo
//
//  Created by Yuto Akiba on 2020/11/13.
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
        }
    }
}
