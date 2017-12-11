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
        emailInput.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "email.png")
        imageView.image = image
        emailInput.leftView = imageView
        passwordInput.leftViewMode = .always
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        if (isValidLogin(email: emailInput, password: passwordInput) != 0) {
            print("There's a login error")
            return
        }
        // TODO: login in with firebase
    }
    
    // checks if given credentials are valid
    func isValidLogin(email: UITextField, password: UITextField) -> Int {
        // TODO: need to check with firebase
        // TODO: handle segue in code
        if (email.text!.isEmpty) {
            print("Invalid email")
            return -1
        }
        if (password.text!.isEmpty) {
            print("Invalid password")
            return -2
        }
        return 0
    }


    @IBAction func signup(_ sender: Any) {
        // TODO: connect segue in code
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
