//
//  TopicTableViewCell.swift
//  RedditClone
//
//  Created by Nadine Siregar on 7/24/17.
//  Copyright © 2017 Nadine Siregar. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topicLabel: UILabel?
    @IBOutlet weak var countLabel: UILabel?
    @IBOutlet weak var upvoteButton: UIButton?
    @IBOutlet weak var downvoteButton: UIButton?
    
    var count: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func voteButtonTapped(sender: UIButton) {
        if sender == upvoteButton {
            count += 1
        } else if sender == downvoteButton {
            count -= 1
        }
        
        countLabel?.text = "\(count)"
    }
    
}
