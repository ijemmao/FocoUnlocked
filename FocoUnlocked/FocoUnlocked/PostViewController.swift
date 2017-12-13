//
//  PostViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/5/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var dishTitle: UITextField!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var pickedImage: UIImageView!
    @IBOutlet weak var directions: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func savePost(_ sender: Any) {
        // Creating new post object
        let currentTime = NSDate()
        if (isPostValid(username: "Kendrick Lamar", dishName: dishTitle, image: pickedImage) != 0) {
            print("This isn't a valid post")
            return
        }
        let newPost = Post(username: "Kendrick Lamar", time: currentTime, dishName: dishTitle.text!, image: UIImagePNGRepresentation(pickedImage.image!)! as NSData, likes: 0);
        print(newPost.toString());
        // goes back to the dashboard
        navigationController?.popViewController(animated: true)
    }
    
    // checks if post is valid
    func isPostValid(username: String, dishName: UITextField, image: UIImageView) -> Int {
        if (username.isEmpty) {
            print("Invalid username")
            return -1
        }
        if (dishName.text!.isEmpty) {
            print("Enter a proper dish title")
            return -2
        }
        if (image.image == nil || (UIImagePNGRepresentation(image.image!)! as NSData).length == 0) {
            print("Provide image")
            return -3
        }
        return 0;
    }
    
    // opens the gallery for user to choose image
    @IBAction func openGallery(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil);
        } else {
            print("gallery not available");
        }
    }
    
    // opens camera for user to take image
    @IBAction func openCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil);
        } else {
            print("camera not available");
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        pickedImage.image = image
        dismiss(animated:true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
