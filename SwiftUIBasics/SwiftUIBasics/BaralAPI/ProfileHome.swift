//
//  HomePage.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import SwiftUI

struct ProfileHome: View {
    
    var viewModel: SignInViewModel
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle("Hello" + "\(String(describing: viewModel.user?.username))")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ProfileHome_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHome(viewModel: SignInViewModel())
    }
}
