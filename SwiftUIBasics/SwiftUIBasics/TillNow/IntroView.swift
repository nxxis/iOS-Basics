//
//  IntroView.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 31/07/2023.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.yellow, Color.white]),
                center: .topLeading,
                startRadius: 15,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            if isLoggedIn {
                ProfileView()
            } else {
                OnBoardingView()
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
