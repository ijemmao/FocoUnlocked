//
//  SignupViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/10/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignupViewController: UIViewController {
    
    var ref: FIRDatabaseReference!

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        // includes icons to the left of email and password inputs
        textFieldImage(textField: emailInput, imageName: "email", x: 10, y: 15, width: 30, height: 20)
        textFieldImage(textField: passwordInput, imageName: "padlock", x: 15, y: 13, width: 20, height: 25)
        textFieldImage(textField: usernameInput, imageName: "user", x: 14, y: 15, width: 23, height: 20)
    }
    
    func textFieldImage(textField: UITextField, imageName: String, x: Int, y: Int, width: Int, height: Int) {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named: imageName)
        imageView.image = image
        textField.addSubview(imageView)
        let leftView = UIView(frame: CGRect(x: 15, y: 0, width: 50, height: 30))
        textField.leftView = leftView
        textField.leftViewMode = .always
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
        FIRAuth.auth()?.createUser(withEmail: emailInput.text!, password: passwordInput.text!) { (user, error) in
            if let error = error {
                print("There's an error creating an account with firebase: \(error)")
                return
            }
            print("\(self.emailInput.text!) created!")
            self.ref.child("users/\(user!.uid)/username").setValue(self.usernameInput.text!)
            self.performSegue(withIdentifier: "signedUp", sender: nil)
        }
        // TODO: make new account with firebase
    }
    
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
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
