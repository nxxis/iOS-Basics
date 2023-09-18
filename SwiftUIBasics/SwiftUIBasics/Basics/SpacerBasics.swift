//
//  SpacerBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 25/07/2023.
//

import SwiftUI

struct SpacerBasics: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
       
                Spacer()
//                    .frame(height: 10)
//                    .background(.red)
                
                Image(systemName: "gear")
        
                
                
                
                
                
                
                
                
                
                
                
                
    //            Spacer(minLength: 0)
    //                .frame(height: 20)
    //                .background(.orange)
    //
    //            Rectangle()
    //                .frame(width: 50, height: 50)
    //
    //            Spacer()
    //                .frame(height: 20)
    //                .background(.orange)
    //
    //            Rectangle()
    //                .fill(.red)
    //                .frame(width: 50, height: 50)
    //
    //            Spacer()
    //                .frame(height: 20)
    //                .background(.orange)
    //
    //            Rectangle()
    //                .fill(.green)
    //                .frame(width: 50, height: 50)
    //
    //            Spacer(minLength: 0)
    //                .frame(height: 20)
    //                .background(.orange )
            }
            .font(.title)
//            .background(.gray)
            .padding(.horizontal)
//        .background(.blue)
            
        Spacer()
//                .frame(width: 10)
//                .background(.red)
            Rectangle()
                .frame(height: 60)
        }
    }
}

struct SpacerBasics_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBasics()
    }
}
