//
//  TopicTableViewCell.swift
//  RedditClone
//
//  Created by Nadine Siregar on 7/24/17.
//  Copyright © 2017 Nadine Siregar. All rights reserved.
//

import UIKit

protocol TopicTableViewCellDelegate {
    func updateTopic(topic: Topic)
}

class TopicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topicLabel: UILabel?
    @IBOutlet weak var countLabel: UILabel?
    @IBOutlet weak var upvoteButton: UIButton?
    @IBOutlet weak var downvoteButton: UIButton?
    
    var delegate: TopicTableViewCellDelegate?
    
    var topic: Topic? {
        didSet {
            topicLabel?.text = topic?.topicName
            
            if let count: Int = topic?.count {
                countLabel?.text = "\(count)"
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func voteButtonTapped(sender: UIButton) {
        if sender == upvoteButton {
            topic?.count += 1
        } else if sender == downvoteButton {
            topic?.count -= 1
        }
        
        if let count: Int = topic?.count {
            countLabel?.text = "\(count)"
        }
        
        if let topic = topic {
            delegate?.updateTopic(topic: topic)    // refresh to sort tableView by number of votes
        }
    }
    
}
