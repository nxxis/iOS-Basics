//
//  Shapes.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
//        Circle()
//        Ellipse()
//        Capsule(style: .circular)
//        Rectangle()
        RoundedRectangle(cornerSize: CGSize(width: 30, height: 20))
                    .fill(.blue) ///content option
        //            .foregroundColor(.gray)
        //            .stroke(.red)
        //            .stroke(.blue, lineWidth: 30)
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [10]))
//            .trim(from: 0.2, to: 1.0)
//            .stroke(Color.gray, lineWidth:  20)
            .frame(width: 200, height: 100, alignment: .center)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
