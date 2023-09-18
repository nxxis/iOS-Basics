//
//  StacksBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 25/07/2023.
//

import SwiftUI

struct StacksBasics: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack {
                Text("Name:")
                    .font(.system(size: 20))
                
                Text("enter your name")
                Spacer()
            }
            
            HStack {
                Text("Address:")
                    .font(.system(size: 20))
                
                Text("enter your address")
                Spacer()
            }
            
            HStack {
                Text("Age:")
                    .font(.system(size: 20))
                
                Text("enter your age")
                Spacer()
            }
        }
        
        
        
//        VStack(alignment: .center, spacing: 20 ) {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//        }
    }
}

struct StacksBasics_Previews: PreviewProvider {
    static var previews: some View {
        StacksBasics()
    }
}
