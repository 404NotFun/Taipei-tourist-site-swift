//
//  TouristSiteListTableViewCell.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/25.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class TouristSiteListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
//    public var delegate: MeowToggleTableViewCellDelegate?
    
    public var touristSiteViewModel: TouristSiteViewModel? {
        didSet {
            titleLbl.text = touristSiteViewModel?.title
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        titleLbl
            .changeTextColor(to: AppColor.textColor)
            .changeFontSize(to: 17)
    }
}
