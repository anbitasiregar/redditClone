//
//  ViewController.swift
//  RedditClone
//
//  Created by Nadine Siregar on 7/24/17.
//  Copyright © 2017 Nadine Siregar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TopicTableViewCellDelegate {
    
    @IBOutlet weak var topicsTableView: UITableView?
    
    var topicsList: [Topic] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        topicsTableView?.register(UINib(nibName: "TopicTableViewCell", bundle: nil), forCellReuseIdentifier: "TopicTableViewCell")
        
        // For testing purposes only
        for topicNumber in 1...20 {
            let topic: Topic = Topic(topicName: "Topic \(topicNumber)", count: 0)
            topicsList.append(topic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopicTableViewCell") as? TopicTableViewCell else {
            return UITableViewCell()
        }
        
        let cellTopic: Topic = topicsList[indexPath.row]

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
}

