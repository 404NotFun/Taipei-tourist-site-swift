//
//  ModallyNavigationBar.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/25.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

@objc
public protocol PresentModallyNavigationBarDelegate: class {
    func presentModallyNavigationBarDidTapCrossButton()
    @objc optional func presentModallyNavigationBar(rightButtonClicked button: UIButton)
}

final public class PresentModallyNavigationBar: UIView {
    
    private var backButton: UIButton!
    public private(set) var titleLabel: UILabel!
    public private(set) var rightButton: UIButton?
    
    public weak var delegate: PresentModallyNavigationBarDelegate?
    
    // MARK: - Init
    public convenience init(title: String) {
        self.init(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 64)))
        
        configureTitleLabel()
        configureCrossButton()
        
        titleLabel.text = title
        
        backgroundColor = AppColor.mainOrange
        applyShadow(shadowRadius: 4, shadowOpacity: 0.05, shadowColor: UIColor.black, shadowOffset: CGSize(width: 0, height: 2))
    }
    
    public convenience init(title: String, rightButtonTitle: String) {
        self.init(title: title)
        
        configureRightButton(title: rightButtonTitle)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCrossButton() {
        backButton = UIButton(type: .system)
        backButton.setImage(#imageLiteral(resourceName: "back_icon"), for: .normal)
        backButton.tintColor = .white
        backButton
            .change(height: 20)
            .change(width: 20)
            .move(16, pointsLeadingToAndInside: self)
            .move(12, pointsBottomToAndInside: self)
            .anchor(to: self)
        backButton.addTarget(self,
                             action: #selector(PresentModallyNavigationBar.crossButtonClicked),
                             for: .touchUpInside)
        
        let extendedView = HitTestExtendedView(withWidth: 40, andReceiverView: backButton)
        extendedView.centerX(to: backButton).centerY(to: backButton).anchor(to: self)
    }
    
    private func configureTitleLabel() {
        let fontSize = 17.cgFloat
        titleLabel = UILabel()
            .changeFont(to: UIFont.boldSystemFont(ofSize: fontSize))
            .changeTextColor(to: .white)
            .changeTextAlignment(to: .center)
            .change(width: bounds.width)
            .change(height: fontSize)
            .centerX(inside: self)
            .move(14, pointsBottomToAndInside: self)
            .anchor(to: self)
    }
    
    private func configureRightButton(title: String) {
        rightButton = UIButton(type: .system)
        rightButton?.setTitle(title, for: .normal)
        rightButton?.tintColor = .white
        rightButton?.sizeToFit()
        rightButton?
            .change(height: 20)
            .move(16, pointsTrailingToAndInside: self)
            .move(12, pointsBottomToAndInside: self)
            .anchor(to: self)
        rightButton?.addTarget(self,
                               action: #selector(PresentModallyNavigationBar.rightButtonClicked(button:)),
                               for: .touchUpInside)
        
        let extendedView = HitTestExtendedView(withWidth: 40, andReceiverView: rightButton)
        extendedView.frame.size.width = rightButton!.bounds.width
        extendedView.centerX(to: rightButton!).centerY(to: rightButton!).anchor(to: self)
    }
    
    @objc private func crossButtonClicked() {
        delegate?.presentModallyNavigationBarDidTapCrossButton()
    }
    
    @objc private func rightButtonClicked(button: UIButton) {
        delegate?.presentModallyNavigationBar?(rightButtonClicked: button)
    }
    
}
