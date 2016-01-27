//
//  SwitchCell.swift
//  Yelp
//
//  Created by Brian Hillsley on 1/26/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    optional func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {
    
    weak var delegate: SwitchCellDelegate?
    
    @IBOutlet weak var switchLabel: UILabel!

    @IBOutlet weak var onSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents:UIControlEvents.ValueChanged)
        // Initialization code
    }
    func switchValueChanged(){
        print("switch value changed")
        delegate?.switchCell?(self, didChangeValue:onSwitch.on)
    
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
