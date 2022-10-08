//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Al E on 10/1/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
    var tweetId:Int = -1
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed \(error )")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed \(error )")
            })
        }
    }
    @IBOutlet weak var retweetButton: UIButton!
    
    
   
    func setRetweeted(_ isRetweeted:Bool) {
           if (isRetweeted){
               retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
               retweetButton.isEnabled = false
           } else {
               retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
               retweetButton.isEnabled = true
           }
       }
      
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
           }, failure: { (error) in
               print("Error in retweeting \(error)")
           })
       }
    func setFavorite(_ isFavorited:Bool) {
            favorited = isFavorited
            if (favorited) {
                favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
            }
            else{
                favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

        }
}

