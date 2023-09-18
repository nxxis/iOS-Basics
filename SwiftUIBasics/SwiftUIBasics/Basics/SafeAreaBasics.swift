//
//  SafeAreaBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct SafeAreaBasics: View {
    var body: some View {
//        ZStack {
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Text("Hello")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(height: 200)
                            .shadow(radius: 10)
                            .padding(20)
                        
                    }
                }
            }
            .background(.blue)
            .background(
                Color.red
                    .edgesIgnoringSafeArea(.all)
            )
//        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //        ZStack {
        //
        //            Color.blue
        //            .edgesIgnoringSafeArea(.all)
        //
        //            VStack {
        //                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //                Spacer()
        //            }
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .background(.red)
        //        }
    }
}

struct SafeAreaBasics_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaBasics()
    }
}
