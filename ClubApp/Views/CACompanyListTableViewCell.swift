//
//  CACompanyListTableViewCell.swift
//  ClubApp
//
//  Created by Bhagyashree Haresh Khatri on 08/02/2019.
//  Copyright © 2019 Bhagyashree Haresh Khatri. All rights reserved.


import UIKit

class CACompanyListTableViewCell: UITableViewCell {

    @IBOutlet weak var websiteLogoImageView: UIImageView!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var companyDescriptionLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var isFavourite: UIButton!
    @IBOutlet weak var isFollowingBtn: UIButton!

    
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
