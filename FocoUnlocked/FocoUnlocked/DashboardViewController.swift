//
//  ViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/1/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var share: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var like: UIImageView!
    @IBOutlet weak var save: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = "this is a cell"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}

