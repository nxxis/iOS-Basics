//
//  ViewController.swift
//  NavigationPractice
//
//  Created by ebpearls on 10/05/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemPink
        // MARK: - Setting Button
        let settingButton = UIButton(frame: CGRect(x: 35, y: 100, width: 250, height: 50))
        settingButton.setTitle("Main Settings", for: .normal)
        view.addSubview(settingButton)
        settingButton.addTarget(self, action: #selector(onTappedSettingButton), for: .touchUpInside)
        
        // MARK: - Wifi Button
        let wifiPopUp = UIButton(frame: CGRect(x: 35, y: 250, width: 200, height: 55))
        wifiPopUp.setTitle("WiFi-Networks", for: .normal)
        view.addSubview(wifiPopUp)
        wifiPopUp.addTarget(self, action: #selector(onTappedNetworkButton), for: .touchUpInside)
    }
    
    @objc func onTappedSettingButton () {
       
        navigationController?.popViewController(animated: true)
        
    }
    @objc func onTappedNetworkButton () {
      let presentNav = UINavigationController(rootViewController: WiFiViewController())
        present(presentNav,animated: true)
    }
    
    


}

