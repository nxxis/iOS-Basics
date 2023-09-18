//
//  FramesBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct FramesBasics: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(.gray)
            .frame(height: 100, alignment: .top)
            .background(.red)
            .frame(width: 150, alignment: .leading)
            .background(.green)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .frame(height: 200)
            .background(.pink)
            .frame(maxHeight: .infinity, alignment: .top)   /// ALIGNMENT HARU DEFAULT CENTER HUNCHA
            .background(.gray)
        
        
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:  .center)
//            .frame(width: 300, height: 300, alignment: .leading)
//            .background(Color.red)
    }
}

struct FramesBasics_Previews: PreviewProvider {
    static var previews: some View {
        FramesBasics()
    }
}
