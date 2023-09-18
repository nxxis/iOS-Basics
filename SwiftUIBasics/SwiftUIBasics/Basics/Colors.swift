//
//  Colors.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 24/07/2023.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(
                Color(UIColor.secondarySystemBackground))
            .frame(width: 200, height: 100)
//            .shadow(radius: 20)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -10, y: -10)
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
