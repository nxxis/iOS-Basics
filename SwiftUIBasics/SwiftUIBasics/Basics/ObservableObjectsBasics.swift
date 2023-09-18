//
//  ObservableObjectsBasics.swift
//  SwiftUIBasics
//
//  Created by ebpearls on 28/07/2023.
//

import SwiftUI

struct ObservableObjectsBasics: View {
    
    @StateObject var viewModel: FruitViewModel
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(viewModel.fruitArr) { fruit in
                        
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.green)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: viewModel.deleteFruit)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit List")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: {
                                            AnotherView(fruitViewModel: viewModel)
                                        },
                                        label: {
                                            Image(systemName: "arrow.right")
                                                .font(.headline)
                                        })
            )
        }
    }
}

struct ObservableObjectsBasics_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectsBasics(viewModel: FruitViewModel())
    }
}

struct Fruit: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArr: [Fruit] = []
    
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        
        let apple = Fruit(name: "Apple", count: 5)
        let mango = Fruit(name: "Mango", count: 10)
        let leechi = Fruit(name: "Leechi", count: 14)
        let orange = Fruit(name: "Orange", count: 21)
        let tomato = Fruit(name: "Tomato", count: 65)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            self.fruitArr.append(mango)
            self.fruitArr.append(leechi)
            self.fruitArr.append(orange)
            self.fruitArr.append(apple)
            self.fruitArr.append(tomato)
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArr.remove(atOffsets: index)
    }
}


struct AnotherView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                ForEach(fruitViewModel.fruitArr) { fruit in
                    Text(fruit.name)
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}
