//
//  Topic.swift
//  RedditClone
//
//  Created by Nadine Siregar on 7/24/17.
//  Copyright © 2017 Nadine Siregar. All rights reserved.
//

import Foundation

struct Topic {
    var topicName: String
    var count: Int
    
    init(topicName: String, count: Int) {
        self.topicName = topicName
        self.count = count
    }
}
