//
//  PaddingBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 25/07/2023.
//

import SwiftUI

struct PaddingBasics: View {
    var body: some View {
        VStack(alignment: .leading) {
             Text("Hi!")
                .font(.title)
            .fontWeight(.bold)
            .padding(.bottom, 20)
            Text("This is vertical stack here.. and multiple line will default goes to leading alignment")
                
        }
        .padding() /// padding defalt values sets to 10
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(15)
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 10)
            
        )
        .padding(.horizontal, 10)
        
        
        
        
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(.red)
//            .padding(.all, 10)
//            .padding(.leading, 20)
//            .background(.blue)
    }
}

struct PaddingBasics_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBasics()
    }
}
