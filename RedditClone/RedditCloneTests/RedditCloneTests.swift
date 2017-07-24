//
//  RedditCloneTests.swift
//  RedditCloneTests
//
//  Created by Nadine Siregar on 7/24/17.
//  Copyright © 2017 Nadine Siregar. All rights reserved.
//

import XCTest
@testable import RedditClone

class RedditCloneTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.topicsList = []
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTopicSort() {
        var topicsList: [Topic] = []
        topicsList.append(Topic(topicName: "Topic1", count: 2))
        topicsList.append(Topic(topicName: "Topic2", count: 1))
        topicsList.append(Topic(topicName: "Topic3", count: 10))
        
        viewController.topicsList = topicsList
        viewController.refreshTableView()
        
        // refreshTableView() sorts the topics list by descending order of count, so the order of topicsList after this call should
        // Topic3 -> Topic1 -> Topic2
        XCTAssertEqual(viewController.topicsList[0].topicName, "Topic3")
        XCTAssertEqual(viewController.topicsList[1].topicName, "Topic1")
        XCTAssertEqual(viewController.topicsList[2].topicName, "Topic2")
    }
    
    func testAddTopicErrorWithEmptyTopic() {
        // Here, we start with an empty topicsList
        
        // We try adding a new EMPTY topic
        viewController.addNewTopic(topic: "")
        
        // After adding empty topic, topicsList shouldn't have changed because this is invalid input
        XCTAssertEqual(viewController.topicsList.count, 0)
    }
    
    func testAddTopicErrorWithFullTopicsList() {
        
        // We start with a full topicsList. Max number of topics is 20
        for topicCount in 1...20 {
            let newTopic: Topic = Topic(topicName: "Topic \(topicCount)", count: 1)
            viewController.topicsList.append(newTopic)
        }
        
        // We try adding topic 21
        viewController.addNewTopic(topic: "Topic 21")
        
        // TopicsList shouldn't have changed because we cannot add anymore topics after max number (20) is reached
        XCTAssertEqual(viewController.topicsList.count, 20)
    }
    
    func testAddTopicSuccess() {
        // Here, we start with an empty topicsList
        
        // We try adding topic 1
        viewController.addNewTopic(topic: "Topic 1")
        
        // Topic1 should have been added to TopicsList
        XCTAssertEqual(viewController.topicsList.count, 1)
    }
    
}
