//
//  SwiftUIBasicsApp.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

@main
struct SwiftUIBasicsApp: App {
    var body: some Scene {
        WindowGroup {
            LandingPage(viewModel: SignInViewModel())
        }
    }
}
