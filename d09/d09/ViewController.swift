//
//  ViewController.swift
//  d09
//
//  Created by Константин Мишин on 02.10.2021.
//

import UIKit

import LocalAuthentication

class ViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signin(_ sender: UIButton) {
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "Please authenticate to proceed.") { [weak self] (success, error) in
                if success {
                    DispatchQueue.main.async {
                        self?.dismiss(animated: true, completion: nil)
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }

}

