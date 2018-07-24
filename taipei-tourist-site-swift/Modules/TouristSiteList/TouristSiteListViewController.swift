//
//  TouristSiteListViewController.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

import UIKit

public struct TouristSiteViewModel {
    let title: String
}

final public class TouristSiteListViewModel {
    let listCount: Int
    let listTitle: String
    var list: [TouristSiteViewModel]
    
    required public init (listCount: Int, listTitle: String, list: [TouristSiteViewModel]) {
        self.listCount = listCount
        self.list = list
        self.listTitle = listTitle
    }
    
}

public protocol TouristSiteListView: class {
    func presentInitContent()
}

final public class TouristSiteListViewController: UIViewController, TouristSiteListView {
    private var navigationBar: PresentModallyNavigationBar!
    fileprivate private(set) var touristSiteListTableView: UITableView!
    fileprivate let headerCellHeight = 54.cgFloat
    
    public var presenter: TouristSiteListPresenter?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTouristSiteListTableView()
        
        presenter?.loadContent()
        
        view.backgroundColor = AppColor.lightBackgroundColor
    }
    
    public func presentInitContent() {
        touristSiteListTableView.reloadData()
    }
    
    /**
     * Configure View
     **/
    private func configureNavigationBar() {
        navigationBar = PresentModallyNavigationBar(title: "台北市旅遊熱點")
        navigationBar.delegate = self
        navigationBar.anchor(to: view)
    }
    
    private func configureTouristSiteListTableView() {
        touristSiteListTableView = UITableView(frame: CGRect(x: 0,
                                                      y: navigationBar.bounds.height,
                                                      width: view.bounds.width,
                                                      height: view.bounds.height - navigationBar.bounds.height))
        touristSiteListTableView.anchor(to: view)
        touristSiteListTableView.separatorStyle = .none
        touristSiteListTableView.backgroundColor = .clear
        
        touristSiteListTableView.register(cellTypes: [TouristSiteListTableViewCell.self])
        touristSiteListTableView.delegate = self
        touristSiteListTableView.dataSource = self
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    public func presentInitialContent() {
        touristSiteListTableView.reloadData()
    }
}

extension TouristSiteListViewController : PresentModallyNavigationBarDelegate {
    
    public func presentModallyNavigationBarDidTapCrossButton() {
        presenter?.closeTouristSiteListView()
    }
    
}

extension TouristSiteListViewController : UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerCellHeight
    }
    
}

extension TouristSiteListViewController : UITableViewDataSource {
    
    private func generateHeaderView(title: String?) -> UIView {
        let view = UIView()
            .change(width: touristSiteListTableView.bounds.width)
            .change(height: headerCellHeight)
        let left = 16.cgFloat
        let label = UILabel()
            .changeFontSize(to: 12)
            .changeTextColor(to: AppColor.darkTextColor)
            .change(height: 12)
            .change(width: touristSiteListTableView.bounds.width - 2 * left)
            .move(10, pointsBottomToAndInside: view)
            .move(left, pointsLeadingToAndInside: view)
            .anchor(to: view)
        label.text = title
        return view
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return generateHeaderView(title: presenter?.touristSiteListViewModel.listTitle)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.touristSiteListViewModel.listCount ?? 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.touristSiteListViewModel.list.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TouristSiteListTableViewCell.self, for: indexPath)
        cell.touristSiteViewModel = presenter?.touristSiteListViewModel.list[indexPath.row]
        return cell
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(with: MeowCheckBoxTableViewCell.self, for: indexPath)
//            cell.viewModel = presenter?.settingsListViewModel.soundList[indexPath.row]
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(with: MeowToggleTableViewCell.self, for: indexPath)
//            cell.otherSettingViewModel = presenter?.settingsListViewModel.otherSettingList[indexPath.row]
//            cell.delegate = self
//            return cell
//        }
    }
    
}

