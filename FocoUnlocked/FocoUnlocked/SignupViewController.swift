//
//  SignupViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/10/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signup(_ sender: Any) {
        if (isValidSignup(username: usernameInput, email: emailInput, password: passwordInput) != 0) {
            print("There's a signup error")
            return
        }
        // TODO: make new account with firebase
    }
    
    @IBAction func login(_ sender: Any) {
        // TODO: connect segue in code
    }
    
    func isValidSignup(username: UITextField, email: UITextField, password: UITextField) -> Int {
        // TODO: need to check with firebase
        // TODO: handle segue in code
        if (username.text!.isEmpty) {
            print("Invalid username")
            return -1
        }
        if (email.text!.isEmpty) {
            print("Invalid email")
            return -2
        }
        if (password.text!.isEmpty) {
            print("Invalid password")
            return -3
        }
        return 0
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
