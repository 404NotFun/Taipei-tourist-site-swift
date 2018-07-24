//
//  HitTestExtendedView.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/25.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

final public class HitTestExtendedView: UIView {
    
    public weak var receiver: UIView?
    
    public convenience init(withWidth: CGFloat, andReceiverView r: UIView?) {
        self.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: withWidth, height: withWidth)))
        
        self.receiver = r
    }
    
    fileprivate override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return (self.point(inside: point, with: event) ? receiver : nil)
    }
    
}
