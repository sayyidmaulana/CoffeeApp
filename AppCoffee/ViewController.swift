//
//  ViewController.swift
//  AppCoffee
//
//  Created by Sayyid Maulana Khakul Yakin on 11/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
        navigation.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}

