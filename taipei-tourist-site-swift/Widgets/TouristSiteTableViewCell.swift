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
    @IBOutlet weak var contentLbl: ExpandableLabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageCvCellViewModels: [ImageCvCellViewModel] = []
    
    public var viewModel: TouristSiteViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLbl.text = viewModel.title
            contentLbl.text = viewModel.content
//            imageCvCellViewModels = TtsHelper.splitFile(viewModel.imageUrls).map({ImageCvCellViewModel(imageUrl: $0)})
//            setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: viewModel.row)
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        titleLbl
            .changeTextColor(to: AppColor.darkTextColor)
            .changeFontSize(to: 16)
        contentLbl
            .changeTextColor(to: AppColor.textColor)
            .changeFontSize(to: 12)
        
        contentLbl.numberOfLines = 3
        contentLbl.collapsedAttributedLink = NSAttributedString(string: "[顯示更多]")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentLbl.collapsed = true
        contentLbl.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        collectionView.register(cellType: ImageCollectionViewCell.self)
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
    }
}

public struct TouristSiteViewModel {
    let title: String
    let content: String
    let imageUrls: String
    let row: Int
    var collapse: Bool = true
}
