//
//  AnimationBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct AnimationBasics: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(
                    Animation
                    .default
                        .repeatForever(autoreverses: true)
//                        .repeatCount(100, autoreverses: true)
                    ) {
                    isAnimated.toggle()
                }
            }
            
//            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 75 : 30)
                .fill(isAnimated ? .blue : .red)
                .frame(
                    width: isAnimated ? 75 : 75,
                    height: isAnimated ? 75 : 350)
                .rotationEffect(Angle(degrees:  isAnimated ? 720 : 180))
                .offset(y: isAnimated ? 250 : 0)
        }
    }
}

struct AnimationBasics_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBasics()
    }
}
