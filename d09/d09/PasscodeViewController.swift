//
//  PasscodeViewController.swift
//  d09
//
//  Created by Константин Мишин on 02.10.2021.
//

import UIKit
import LocalAuthentication

class PasscodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
