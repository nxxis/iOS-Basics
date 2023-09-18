//
//  Icons.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct Icons: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .renderingMode(.original)
            .font(.largeTitle)
//            .font(.system(size: 220))
//            .resizable()
//            .scaledToFit()
//            .scaledToFill()
//            .aspectRatio(contentMode: .fit)
//            .foregroundColor(.red)
//            .frame(width: 300, height: 300)
//            .clipped()
    }
}

struct Icons_Previews: PreviewProvider {
    static var previews: some View {
        Icons()
    }
}
