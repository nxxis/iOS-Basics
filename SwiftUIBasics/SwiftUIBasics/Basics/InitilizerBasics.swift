//
//  InitilizerBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 25/07/2023.
//

import SwiftUI

struct InitilizerBasics: View {
    
    let backgroundColor: Color
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text("Hi,")
                .font(.largeTitle)
                .foregroundColor(backgroundColor)
                .underline()
            
            Text("EB Pearls!")
                .font(.headline)
                .foregroundColor(.blue)
            
        }
        .frame(width: 150, height: 150)
        .background(.yellow)
        .cornerRadius(20)
    }
}

struct InitilizerBasics_Previews: PreviewProvider {
    static var previews: some View {
        InitilizerBasics(backgroundColor: .black )
    }
}
