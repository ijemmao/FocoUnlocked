//
//  LoginViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/5/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        if (isValidLogin(email: emailInput, password: passwordInput) != 0) {
            print("There's a login error")
            return
        }
    }
    
    // checks if given credentials are valid
    func isValidLogin(email: UITextField, password: UITextField) -> Int {
        // TODO: need to check with firebase
        if (email.text!.isEmpty) {
            print("Invalid email")
            return -1
        }
        if (email.text!.isEmpty) {
            print("Invalid password")
            return -2
        }
        return 0
    }


    @IBAction func signup(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
