//
//  ViewController.swift
//  SelfSizingTableViewCells
//
//  Created by Kyle Shin on 1/2/19.
//  Copyright © 2019 Kyle Shin. All rights reserved.
//

import UIKit

final class ViewController: UITableViewController {
    
    private let cellId = "cellId"
    
    var data:[Post] = []     //we will hardcode the content in this example
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        generatePostData()
        
        tableView.register(MyCell.self, forCellReuseIdentifier: cellId)
        
        //important for self sizing
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        
        tableView.reloadData()
    }
    
    /** Generates data for our table view.
    */
    private func generatePostData(){
        data.append(Post(name: "Kyle", body: "Hi everyone."))
        data.append(Post(name: "Alex\nThe Great", body: "Hi there. Nice to meet you. I'm Alex. What are your favorite teams?"))
        data.append(Post(name: "Kyle", body: "Check out my list.\n1)Warriors\n2)Nuggets\n3)Raptors\n4)Rockets\n5)Bucks"))
        data.append(Post(name: "James Harden", body: "Oh come on, Rockets should clearly be #1!"))
    }

}


extension ViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MyCell
        let post = data[indexPath.row]
        cell.name.text = post.name
        cell.body.text = post.body
        cell.profileImageView.image = UIImage(named: "profile") //for demo purpose only
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
}

//leaving out a profile image, since it doesn't affect the purpose of this demo
struct Post {
    let name: String
    let body: String
}
