//
//  AppStorageBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 31/07/2023.
//

import SwiftUI

struct AppStorageBasics: View {
    
    @AppStorage("username") var currentUsername: String?
    
    var body: some View {
        VStack {
            Text(currentUsername ?? "Your username")
            Button {
                let name = "EB Pearls Photoshoot"
                currentUsername = name
            } label: {
                Text("Save")
            }
        }
    }
}

struct AppStorageBasics_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBasics()
    }
}
