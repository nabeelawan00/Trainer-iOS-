//
//  EventTableViewCell.swift
//  Trainer
//
//  Created by Bills Mac on 01/10/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventDayType: UILabel!
    @IBOutlet weak var eventStartEndTime: UILabel!
    @IBOutlet weak var eventClub: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
