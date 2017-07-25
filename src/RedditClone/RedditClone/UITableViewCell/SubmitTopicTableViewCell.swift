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
    let maxLength: Int = 255

    override func awakeFromNib() {
        super.awakeFromNib()
        topicTextField?.delegate = self
        submitButton?.layer.cornerRadius = 4
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewTopic()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= maxLength   // To ensure the user cannot add a topic name > 255 characters long
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
