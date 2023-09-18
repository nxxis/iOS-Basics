//
//  SocialNetworkApp.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import SwiftUI

@main
struct SocialNetworkApp: App {
    var body: some Scene {
        WindowGroup {
            LoginScreen(viewModel: LoginViewModel())
        }
    }
}
