//
//  CAMembersListTableViewCell.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 10/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.
//

import UIKit

class CAMembersListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memberNameLbl: UILabel!
    @IBOutlet weak var memberAgeLbl: UILabel!
    @IBOutlet weak var memberMailLbl: UILabel!
    @IBOutlet weak var memberPhoneNoLbl: UILabel!
    @IBOutlet weak var isFavourite: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
