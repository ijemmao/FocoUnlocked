//
//  ViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/1/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DashboardViewController: UIViewController, UITableViewDataSource {
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell();
//        cell.textLabel?.text = "this is a cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Post") as! PostCellTableViewCell
//        let cell = UITableViewCell() as! PostCellTableViewCell
//        cell.username.text = "Ijemma Onwuzulike"
//        cell.date.text = "8 hours ago"
//        cell.dishName.text = "Cereal"
//        cell.likeCount.text = "800 likes"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        ref.child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            count = (value?.count)!
            return
        })
        return count
    }

}

