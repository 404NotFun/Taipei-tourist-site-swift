//
//  ImageCollectionViewCell.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/31.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    public var viewModel: ImageCvCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageView.sd_setImage(with: URL(string: viewModel.imageUrl))
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }

}

public struct ImageCvCellViewModel {
    let imageUrl: String
}
