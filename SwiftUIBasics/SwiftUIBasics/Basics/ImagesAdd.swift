//
//  ImagesAdd.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct ImagesAdd: View {
    var body: some View {
        Image("g")
//            .renderingMode(.template)
            .resizable()
        //            .aspectRatio(contentMode: .fill)
        //            .scaledToFit()
            .scaledToFit()
            .frame(width: 350, height: 300)
            .foregroundColor(.red)
        //            .clipped()
        //            .cornerRadius(30)
//            .clipShape(
//                Circle()
                //                RoundedRectangle(cornerRadius: 20)
                //                Ellipse()
//            )
    }
}

struct ImagesAdd_Previews: PreviewProvider {
    static var previews: some View {
        ImagesAdd()
    }
}
