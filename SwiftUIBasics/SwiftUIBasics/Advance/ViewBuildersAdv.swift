//
//  ViewBuildersAdv.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 01/08/2023.
//

import SwiftUI

struct ViewBuildersAdv: View {
    var body: some View {
        
        VStack {
            HeaderViewRegular(title: "EB Pearls", address: "Kupandole")
            Spacer()
        }
    }
}

struct HeaderViewRegular: View {
    
    let title: String
    let address: String?
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let address = address {
                Text(address)
                    .font(.callout)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<Content:View>: View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 1)
            
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct LocalViewBuilder: View {
    
    enum ViewType {
        case one
        case two
        case three
    }
    
    let type: ViewType
    
    var body: some View {
       
            headerSection
    }
    
    @ViewBuilder
    private var headerSection: some View {
         
             switch type {
             case .one:
                  viewOne
             case .two:
                  viewTwo
             case .three:
                  viewThree
             }
    }
    
    private var viewOne: some View {
        Text("one")
    }
    
    private var viewTwo: some View {
        Text("two")
    }
    
    private var viewThree: some View {
        Text("three")
    }
    
}

struct ViewBuildersAdv_Previews: PreviewProvider {
    static var previews: some View {
        LocalViewBuilder(type: .two)
    }
}
