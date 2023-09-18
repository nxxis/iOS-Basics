//
//  NavigationBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 27/07/2023.
//

import SwiftUI

struct NavigationBasics: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                NavigationLink("Hi,click") {
                    SecondView()
                }
            }
            .navigationTitle("Settings")
            //            .navigationBarTitleDisplayMode(.inline)
            //            .navigationBarHidden(true)
            .navigationBarItems(
                leading:
                    
                    HStack {
                        
                        Image(systemName: "person")
                        Image(systemName: "flame")
                            .padding(.leading, 50)
                    },
                
                trailing: NavigationLink(destination: {
                    SecondView()
                }, label: {
                    Image(systemName: "gear")
                })
                .accentColor(.red)
            )
        }
    }
}

struct SecondView: View {
    
    @Environment(\.dismiss) var presentationMode
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationTitle("Wi-Fi")
            
            VStack {
                
                Button("Back") {
                    presentationMode.callAsFunction()
                }
                NavigationLink("Networks", destination: Text("Searching.."))
                
            }
        }
    }
}


struct NavigationBasics_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBasics()
    }
}
