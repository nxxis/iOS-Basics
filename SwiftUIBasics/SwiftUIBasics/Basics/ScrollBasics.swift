//
//  ScrollBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 25/07/2023.
//

import SwiftUI

struct ScrollBasics: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                                    .overlay {
                                        Text("HI")
                                            .font(.largeTitle)
                                    }
                            }
                        }
                    }
                    
//                    RoundedRectangle(cornerRadius: 35)
//                        .fill(.white)
//                        .frame(width: 200, height: 150)
//                        .shadow(radius: 10)
//                        .padding()
//                        .overlay {
//                            Text("HI")
//                                .font(.largeTitle)
//                        }
                }
            }
        }
    }
}

struct ScrollBasics_Previews: PreviewProvider {
    static var previews: some View {
        ScrollBasics()
    }
}
