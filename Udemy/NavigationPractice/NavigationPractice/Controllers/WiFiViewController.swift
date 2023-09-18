//
//  WiFiViewController.swift
//  NavigationPractice
//
//  Created by ebpearls on 10/05/2023.
//

import UIKit

class WiFiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WiFi-Networks"
        view.backgroundColor = .lightGray
        let wifiDismissButton = UIButton(frame: CGRect(x: 20, y: 30, width: 100, height: 50))
        wifiDismissButton.setTitle("Dismiss", for: .normal)
        view.addSubview(wifiDismissButton)
        wifiDismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        
        // MARK: - Test Button
        let testButton = UIButton(frame: CGRect(x: 200, y: 200, width: 50, height: 40))
        testButton.setTitle("test", for: .normal)
        testButton.backgroundColor = .black
        view.addSubview(testButton)
        testButton.addTarget(self, action: #selector(onTappedTestButton), for: .touchUpInside)
        
        
        
        }
        

        // Do any additional setup after loading the view.
    @objc func dismissButtonTapped () {
        //navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
    @objc func onTappedTestButton () {
        navigationController?.pushViewController(RootNavigationViewController(), animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
