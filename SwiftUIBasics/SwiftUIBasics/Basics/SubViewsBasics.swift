//
//  SubViewsBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 26/07/2023.
//

import SwiftUI

struct SubViewsBasics: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack(spacing: 15) {
            ItemView(title: "Banana", count: 0, color: .yellow)
            ItemView(title: "Orange", count: 0, color: .orange)
            ItemView(title: "Strawberry", count: 0, color: .red)
        }
    }
}

struct ItemView: View {
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .padding(.horizontal, 10)
        .background(color)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct SubViewsBasics_Previews: PreviewProvider {
    static var previews: some View {
        SubViewsBasics()
    }
}
