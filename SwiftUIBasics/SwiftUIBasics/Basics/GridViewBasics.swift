//
//  GridViewBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 25/07/2023.
//

import SwiftUI

struct GridViewBasics: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible() , spacing: 6, alignment: nil),
        GridItem(.flexible() , spacing: 6, alignment: nil),
        GridItem(.flexible() , spacing: 6, alignment: nil),
    ]
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(.gray)
                .frame(height: 350)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(
                        header:
                            Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                            .padding()
                        
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 180)
                        }
                    }
                    
                    Section(
                        header:
                            Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                            .padding()
                        
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(.red)
                                .frame(height: 180)
                        }
                    }
                }
            )
        }
    }
}

struct GridViewBasics_Previews: PreviewProvider {
    static var previews: some View {
        GridViewBasics()
    }
}
