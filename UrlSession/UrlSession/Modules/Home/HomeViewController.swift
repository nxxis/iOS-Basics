//
//  ViewController.swift
//  UrlSession
//
//  Created by ebpearls on 12/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let screenView: HomeView
    
    // MARK: - Initilization
    init(with view: HomeView) {
        self.screenView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controlller Life Cycle
    override func loadView() {
        super.loadView()
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPersonDetails()
    }
    
    func getPersonDetails() {
        let session = URLSession.shared
        let serviceURL = URL(string: "https://gorest.co.in/public/v2/users")
        let task = session.dataTask(with: serviceURL!) { serviceData, serviceResponse, error in
            if error == nil {
                let httpResponse = serviceResponse as! HTTPURLResponse
                if (httpResponse.statusCode == 200){
                    let jsonData = try? JSONSerialization.jsonObject(with: serviceData!, options: .mutableContainers)
                    let result = jsonData as! [[String:Any]]
                    DispatchQueue.main.async {
                        for value in result {
                            self.screenView.fetchedUserIdLabel.text = "\(value["id"] as! Int)"
                            self.screenView.fetchedIdLabel.text = "\(value["name"] as! String)"
                            self.screenView.fetchedTitleLabel.text = (value["email"] as! String)
                            self.screenView.fetchedIsCompletedLabel.text = (value["gender"] as! String)
                        }
                    }
                }
            }
        }
        task.resume()
    }
}


