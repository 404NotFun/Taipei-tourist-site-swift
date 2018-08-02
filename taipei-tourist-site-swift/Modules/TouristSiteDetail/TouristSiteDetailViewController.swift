//
//  TouristSiteDetailViewController.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/8/2.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit
import TMBase
import SDWebImage

public class TouristSiteDetailViewController: UIViewController {
    fileprivate private(set) var imageCellViewModel: ImageCvCellViewModel!
    fileprivate lazy var imageView = UIImageView(frame: CGRect.zero)
    
    public convenience init(imageCellViewModel: ImageCvCellViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.imageCellViewModel = imageCellViewModel
    }
    
    public override func loadView() {
        super.loadView()
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(44, 0, 0, 0))
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        imageView.sd_setImage(with: URL(string: self.imageCellViewModel.imageUrl), completed: nil)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        func initNaviBar() {
            if let naviVC = self.navigationController {
                AppConfig.setNavigationBarThemeDefault(naviVC)
            }
        }
        self.title = "台北市熱門景點"
        initNaviBar()
    }
}
