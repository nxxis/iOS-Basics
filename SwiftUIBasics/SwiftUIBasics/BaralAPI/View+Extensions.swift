//
//  View+Extensions.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 02/08/2023.
//

import SwiftUI

extension View {
    func defaultForm() -> some View {
        modifier(FormViewModifier())
    }
    
    func defaultButton() -> some View {
        modifier(ButtonViewModifier())
    }
}
