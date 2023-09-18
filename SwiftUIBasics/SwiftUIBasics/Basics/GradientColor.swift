//
//  Gradient.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct GradientColor: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //                LinearGradient(
                //                    gradient: Gradient(colors: [Color.red, Color.blue]),
                //                    startPoint: .topLeading,
                //                    endPoint: .bottom)
//                RadialGradient(
//                    gradient: Gradient(colors: [Color.gray, Color.cyan]),
//                    center: .topLeading,
//                    startRadius: 5,
//                    endRadius: 400)
                AngularGradient(
                    gradient: Gradient(colors: [Color.blue, Color.red]),
                    center: .topLeading,
                    angle: .degrees(180+45))
            )
            .frame(width: 300, height: 200)
    }
}

struct Gradient_Previews: PreviewProvider {
    static var previews: some View {
        GradientColor()
    }
}
