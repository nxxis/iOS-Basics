//
//  TabViewBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 28/07/2023.
//

import SwiftUI

struct TabViewBasics: View {
    
    @State var selectedTab: Int = 0
    let icons: [String] = ["heart", "gear", "person"]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(
                gradient: Gradient(colors: [Color.red,Color.blue]),
                center: .center,
                startRadius: 5,
                endRadius: 300)
        )
        .frame(height: 350)
        .tabViewStyle(.page)
        
        
        
        
        
        
        //        TabView(selection: $selectedTab) {
        //            HomeView(selectedTab: $selectedTab)
        //                .tabItem {
        //                    Image(systemName: "house")
        //                    Text("Home")
        //                }
        //                .tag(0)
        //
        //            Text("Browse")
        //                .tabItem {
        //                    Image(systemName: "globe")
        //                    Text("Internet")
        //                }
        //                .tag(1)
        //
        //
        //            Text("Profile")
        //                .tabItem {
        //                    Image(systemName: "person")
        //                    Text("Profile")
        //                }
        //                .tag(2)
        //        }
        .tint(.red)
    }
}

struct TabViewBasics_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBasics()
    }
}

struct HomePageView: View {
    
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea(.all, edges: .top)
            VStack {
                Text("Home")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background()
                        .cornerRadius(15)
                }
            }
        }
    }
}
