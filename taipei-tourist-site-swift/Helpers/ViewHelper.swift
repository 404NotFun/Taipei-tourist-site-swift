//
//  ViewHelper.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/31.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class ViewHelper {
    static func generateHeaderView(title: String?, width: CGFloat, height: CGFloat) -> UIView {
        let view = UIView()
            .change(width: width)
            .change(height: height)
        let left = 16.cgFloat
        let label = UILabel()
            .changeFontSize(to: 12)
            .changeTextColor(to: AppColor.darkTextColor)
            .change(height: 12)
            .change(width: width - 2 * left)
            .move(10, pointsBottomToAndInside: view)
            .move(left, pointsLeadingToAndInside: view)
            .anchor(to: view)
        label.text = title
        return view
    }
    
    static func addReadMoreBtn(lbl: UILabel, max: Int) {
        
    }
}
