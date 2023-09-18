//
//  EnvironmentObjectBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 28/07/2023.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    
    // MARK: - properties
    @Published var dataArr: [String] = []
    
    // MARK: - initilization
    init () {
        getData()
    }
    
    // MARK: - getData
    func getData() {
        dataArr.append(contentsOf: ["iPhone", "Apple Watch", "iMac", "Macbook Pro"])
    }
}


struct EnvironmentObjectBasics: View {
    
    // MARK: - properties
    @StateObject var viewModel: EnvironmentViewModel
    
    // MARK: - view
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArr, id: \.self, content: { data in
                    
                    NavigationLink {
                        BodyView(selectedItem: data)
                    } label: {
                        Text(data)
                    }
                })
            }
            .navigationTitle("Apple Products")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .environmentObject(viewModel)
    }
}

struct BodyView: View {
    
    // MARK: - properties
    let selectedItem: String
    
    // MARK: - view
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            NavigationLink {
                DeviceView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct DeviceView: View {
    
    // MARK: - properties
    @EnvironmentObject var environmentViewModel: EnvironmentViewModel
    
    // MARK: - view
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                startPoint: .leading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(environmentViewModel.dataArr, id: \.self) { index in
                        Text(index)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnvironmentObjectBasics_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBasics(viewModel: EnvironmentViewModel())
    }
}
