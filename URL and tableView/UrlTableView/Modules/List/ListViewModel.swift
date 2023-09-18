//
//  ListViewModel.swift
//  UrlTableView
//
//  Created by ebpearls on 27/06/2023.
//

import Foundation
import CoreData

class ListViewModel {
    
    // MARK: - properties
    private let httpUtility: HttpUtility
    
    var reloadTable: (() -> Void)?
    
    let context = PersistanceStorage.shared.context
    
    var coreDataArr: [Products] = [] {
        didSet {
            filteredData = coreDataArr
        }
    }
    
    var filteredData: [Products] = [] {
        didSet {
           reloadTable?()
        }
    }
    
    // MARK: - initilization
    init(httpUtility: HttpUtility){
        self.httpUtility = httpUtility
    }
    
    // MARK: - getData
    func getData() {
        if let url = URL(string: "https://dummyjson.com/products") {
            
            httpUtility.getApiData(requestUrl: url, resultType: ProductDetailsGet.self) { [weak self] result in
                guard let self = self else {return}
                self.setCoreData(productList: result.products ?? [])
            }
        }
    }
    
    // MARK: - setCoreData
    func setCoreData(productList: [ProductsGet]) {
        do {
            let request : NSFetchRequest<Products> = Products.fetchRequest()
            
            for product in productList {
                request.predicate = NSPredicate(format: "ANY id IN %@", [product.productId])
                let numberOfRecords = try context.count(for: request)
                if numberOfRecords == 0 {
                    let newProduct = Products(context: self.context)
                    newProduct.id = Int16(product.productId)
                    newProduct.title = product.productTitle
                    newProduct.price = Int16(product.productPrice)
                    newProduct.thumbnail = product.thumbnail
                    newProduct.images = product.images
                    newProduct.descriptions = product.productDescription
                    try context.save()
                }
            }
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    // MARK: -fetchCoreData
    func fetchCoreData() {
        do {
            coreDataArr = try context.fetch(Products.fetchRequest())
        } catch {
            print("Error fetching Core Data: \(error)")
        }
    }
    // MARK: - doSearch
    func doSearch(searchText: String) {
        if searchText.isEmpty {
            filteredData = coreDataArr
        } else {
            filteredData = coreDataArr.filter { product in
                return product.title?.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
    }
}

