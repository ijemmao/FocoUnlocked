//
//  PostViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/5/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref: FIRDatabaseReference!
    var storageRef: FIRStorageReference!
    
    @IBOutlet weak var dishTitle: UITextField!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var pickedImage: UIImageView!
    @IBOutlet weak var directions: UITextView!
    var username: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        storageRef = FIRStorage.storage().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dateToString(date: Date) -> NSString {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date as Date) as NSString
    }
    
    func imageToData(image: UIImage) -> NSData {
        return UIImagePNGRepresentation(image)! as NSData
    }
    @IBAction func savePost(_ sender: Any) {
        
        // TODO: refactor this function
        
        
        // Creating new post object
        let currentTime = NSDate()
        
        ref.child("users").child((FIRAuth.auth()?.currentUser?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            self.username = value?["username"] as? String ?? ""
            
            if (self.isPostValid(username: self.username, dishName: self.dishTitle, image: self.pickedImage) != 0) {
                print("This isn't a valid post")
                return
            }
            
            let currentDate = self.dateToString(date: currentTime as Date)
            let profileImage = self.imageToData(image: UIImage(named: "user")!)
            let dishImage = self.imageToData(image: self.pickedImage.image!)
            
            let newPost = Post(id: UUID().uuidString, username: self.username, userImage: profileImage, time: currentDate, dishName: self.dishTitle.text!, image: dishImage, likes: 0);
            self.ref.child("posts/" + UUID().uuidString).setValue(newPost.toDictionary())
            print(newPost.toString());
            
//            self.storageRef.child(self.username + "/userImage.png")
//            if let uploadData = UIImagePNGRepresentation(UIImage(named: "user")!) {
//                self.storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
//                    if error != nil {
//                        print("ijemma onwuzulike is debugging right now!")
//                        print(error)
//                        return
//                    }
//                    print(metadata)
//                })
//            }
            // goes back to the dashboard
            self.navigationController?.popViewController(animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
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

