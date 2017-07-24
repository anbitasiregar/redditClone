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

    override func viewDidLoad() {
        super.viewDidLoad()

        topicsTableView?.register(UINib(nibName: "TopicTableViewCell", bundle: nil), forCellReuseIdentifier: "TopicTableViewCell")
        topicsTableView?.register(UINib(nibName: "SubmitTopicTableViewCell", bundle: nil), forCellReuseIdentifier: "SubmitTopicTableViewCell")
        
        // For testing purposes only
        for topicNumber in 1...20 {
            let topic: Topic = Topic(topicName: "Topic \(topicNumber)", count: 0)
            topicsList.append(topic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsList.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitTopicTableViewCell") as? SubmitTopicTableViewCell else {
                return UITableViewCell()
            }
            
            cell.delegate = self
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopicTableViewCell") as? TopicTableViewCell else {
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
        guard let topic = topic else {
            return
        }
        
        let newTopic: Topic = Topic(topicName: topic, count: 0)
        topicsList.append(newTopic)
        topicsTableView?.reloadData()
    }
}

