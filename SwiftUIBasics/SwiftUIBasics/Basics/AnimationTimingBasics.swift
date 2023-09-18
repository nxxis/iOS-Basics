//
//  AnimationTimingBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 27/07/2023.
//

import SwiftUI

struct AnimationTimingBasics: View {
    
    @State var isAnimating: Bool = false
    
    let timing: Double = 10.0
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }
            
            //            RoundedRectangle(cornerRadius: 25)
            //                .fill(.red)
            //                .frame(width: isAnimating ? 250 : 50, height: 150)
            //                .animation(
            //                .linear(duration: timing), value: isAnimating)
            //
            //            RoundedRectangle(cornerRadius: 25)
            //                .fill(.red)
            //                .frame(width: isAnimating ? 250 : 50, height: 150)
            //                .animation(
            //                .easeIn(duration: timing), value: isAnimating)
            //
            //            RoundedRectangle(cornerRadius: 25)
            //                .fill(.red)
            //                .frame(width: isAnimating ? 250 : 50, height: 150)
            //                .animation(
            //                .easeInOut(duration: timing), value: isAnimating)
            //
            //            RoundedRectangle(cornerRadius: 25)
            //                .fill(.red)
            //                .frame(width: isAnimating ? 250 : 50, height: 150)
            //                .animation(
            //                .easeOut(duration: timing), value: isAnimating)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.red)
                .frame(width: isAnimating ? 250 : 50, height: 150)
                .animation(
                .spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1.0), value: isAnimating)
        }
    }
}

struct AnimationTimingBasics_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingBasics()
    }
}
