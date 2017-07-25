# redditClone

This app is a Reddit clone where users can upvote and downvote existing topics or add new ones. It was build from scratch using Swift3. I'm assuming there aren't any topics to begin with and that the "score" of each topic is (upvote - downvote).

Since this is a list of the top 20 topics (sorted in descending order), if a user tries to add a 21st topic, an alert will pop up telling them they are unable to add any more topics. Also, if a user tries to add an empty topic, an alert pops up that tells them they're not allowed to.

I created two new delegates: TopicTableViewCellDelegate and SubmitTopicTableViewCellDelegate. For both, the main ViewController is set as the delegate. TopicTableViewCellDelegate's refreshTableView function asks ViewController to sort the topicsList and reload the tableView after every upvote or downvote. SubmitTopicTableViewCellDelegate's addNewTopic function asks ViewController to add the new topic the user has added. ViewController's addNewTopic is where we check the validity of the new topic and shows alerts accordingly.

I also use two UITextViewDelegate functions: textFieldShouldReturn and shouldChangeCharactersIn:replacementString. The first allows the user to add a new topic by simply pressing enter. The second prohibits the user from adding a topic over 255 characters.
