//
//  AlertHelper.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/8/3.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class AlertHelper {
    public static func show(vc: UIViewController, msg: String) {
        let alert = UIAlertController(title: "提示訊息", message: msg, preferredStyle: .alert);
        let cancelAction = UIAlertAction.init(title: "了解", style: .cancel, handler: {(action) in })
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
