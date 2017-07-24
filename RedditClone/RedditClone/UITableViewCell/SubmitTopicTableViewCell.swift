//
//  SubmitTopicTableViewCell.swift
//  RedditClone
//
//  Created by Nadine Siregar on 7/24/17.
//  Copyright © 2017 Nadine Siregar. All rights reserved.
//

import UIKit

protocol SubmitTopicTableViewCellDelegate {
    func addNewTopic(topic: String?)
}

class SubmitTopicTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var topicTextField: UITextField?
    @IBOutlet weak var submitButton: UIButton?
    
    var delegate: SubmitTopicTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        topicTextField?.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewTopic()
        return true
    }
    
    @IBAction func submitButtonTapped(sender: UIButton) {
        addNewTopic()
    }
    
    func addNewTopic() {
        topicTextField?.resignFirstResponder()
        delegate?.addNewTopic(topic: topicTextField?.text)
        topicTextField?.text = ""
    }
    
}
