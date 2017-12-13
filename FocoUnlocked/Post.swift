//
//  Post.swift
//  FocoUnlocked
//
//  Created by Ijemma Onwuzulike on 12/2/17.
//  Copyright © 2017 Ijemma Onwuzulike. All rights reserved.
//

import Foundation

class Post {
    let username: String;
    let userImage: NSData;
    let time: NSDate;
    let dishName: String;
    let image: NSData;
    let likes: Int;
    
    init(username: String, userImage: NSData, time: NSDate, dishName: String, image: NSData, likes: Int) {
        self.username = username
        self.userImage = userImage
        self.time = time
        self.dishName = dishName
        self.image = image
        self.likes = likes
    }
    
    func toString() -> String {
        var state = ""
        state += "Username: \(self.username)"
        state += "\nTime: \(self.time)"
        state += "\nDish Name: \(self.dishName)"
        state += "\nLikes: \(self.likes)"
        return state
    }
}
