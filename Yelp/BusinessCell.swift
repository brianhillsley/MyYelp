//
//  BusinessCell.swift
//  Yelp
//
//  Created by Brian Hillsley on 1/18/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView! 
    
    var business: Business! {
            // observer
        didSet {
            businessNameLabel.text = business.name
            thumbImageView.setImageWithURL(business.imageURL!)
            starsImageView.setImageWithURL(business.ratingImageURL!)
            categoryLabel.text = business.categories
            locationLabel.text = business.address
            reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
            distanceLabel.text = business.distance
        }
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
