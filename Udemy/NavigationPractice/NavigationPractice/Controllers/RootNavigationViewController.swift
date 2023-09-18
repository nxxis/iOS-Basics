//
//  RootNavigationViewController.swift
//  NavigationPractice
//
//  Created by ebpearls on 10/05/2023.
//

import UIKit

class RootNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Setting
        view.backgroundColor = .gray
        title = "Settings"
        
    // MARK: - Button
        let rootButton = UIButton()
        rootButton.setTitle("Wi-Fi", for: .normal)
        view.addSubview(rootButton)
        rootButton.addTarget(self, action: #selector(onTapped), for: .touchUpInside)
        rootButton.setTitleColor(.white , for: .normal)
        rootButton.frame = CGRect(x: 30, y: 210, width: 55, height: 30)
        rootButton.backgroundColor = .systemPink
        
        // MARK: - Label
        let labelOne = UILabel()
        labelOne.text = "Hello World"
        labelOne.frame = CGRect(x: 50, y: 300, width: 100, height: 20)
        view.addSubview(labelOne)
        labelOne.textColor = .white
        labelOne.backgroundColor = .black
        
        // MARK: - Text Field
        let textField = UITextField()
        textField.textColor = .blue
        textField.frame = CGRect(x: 50, y: 350, width: 155, height: 30)
        view.addSubview(textField)
        textField.backgroundColor = .white
        

        // Do any additional setup after loading the view.
    }
    
    
    @objc func onTapped() {
        
        navigationController?.pushViewController(SettingsViewController(), animated: true)
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
