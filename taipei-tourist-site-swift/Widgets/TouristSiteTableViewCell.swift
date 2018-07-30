//
//  TouristSiteTableViewCell.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/28.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class TouristSiteTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    public var viewModel: TouristSiteViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLbl.text = viewModel.title
            contentLbl.text = viewModel.content
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        titleLbl
            .changeTextColor(to: AppColor.textColor)
            .changeFontSize(to: 17)
        contentLbl
            .changeTextColor(to: AppColor.textColor)
            .changeFontSize(to: 15)
    }
}

public struct TouristSiteViewModel {
    let title: String
    let content: String
}
