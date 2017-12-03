//
//  ViewController.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/1/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return 5
    }

}

