//
//  ViewController.swift
//  RedditClone
//
//  Created by Nadine Siregar on 7/24/17.
//  Copyright © 2017 Nadine Siregar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TopicTableViewCellDelegate, SubmitTopicTableViewCellDelegate {
    
    @IBOutlet weak var topicsTableView: UITableView?
    
    var topicsList: [Topic] = []
    
    let topicTableViewCellIdentifier: String = "TopicTableViewCell"
    let submitTopicTableViewCellIdentifier: String = "SubmitTopicTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        topicsTableView?.register(UINib(nibName: topicTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: topicTableViewCellIdentifier)
        topicsTableView?.register(UINib(nibName: submitTopicTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: submitTopicTableViewCellIdentifier)
        topicsTableView?.rowHeight = UITableViewAutomaticDimension
        topicsTableView?.estimatedRowHeight = 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsList.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: submitTopicTableViewCellIdentifier) as? SubmitTopicTableViewCell else {
                return UITableViewCell()
            }
            
            cell.delegate = self
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: topicTableViewCellIdentifier) as? TopicTableViewCell else {
            return UITableViewCell()
        }
        
        let cellTopic: Topic = topicsList[indexPath.row - 1]

        cell.topic = cellTopic
        cell.delegate = self
        return cell
    }
    
    // TopicTableViewCellDelegate
    func refreshTableView() {
        
        // Sort in descending order
        topicsList.sort { (topic1, topic2) -> Bool in
            return topic1.count > topic2.count
        }
        topicsTableView?.reloadData()
    }
    
    // SubmitTopicTableViewCellDelegate
    func addNewTopic(topic: String?) {
        guard let topic = topic, topic.characters.count > 0 else {
            showOKAlert(title: "Sorry!", message: "You cannot add an empty topic.")
            return
        }
        
        if topicsList.count >= 20 {
            showOKAlert(title: "Oops!", message: "The maximum number of topics has been reached. You cannot add more.")
            return
        }
        
        let newTopic: Topic = Topic(topicName: topic, count: 0)
        topicsList.append(newTopic)
        topicsTableView?.reloadData()
    }
    
    func showOKAlert(title: String?, message: String?) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}

