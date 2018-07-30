//
//  HomeViewController.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit
import PullToRefresh
import TMBase
import RxSwift
import RxDataSources
import SnapKit

public class HomeViewController: UIViewController {
    var output: HomeViewOutput!
    var viewModel: HomeViewModel = HomeViewModel(listCount: 0, listTitle: "處理中", list: [])
    private let refresher = PullToRefresh()
    fileprivate lazy var tableView = UITableView.init(frame: CGRect.zero, style: .plain)
    fileprivate let headerCellHeight = 54.cgFloat
    
    public override func loadView() {
        super.loadView()
        func addSubviews() {
            view.addSubview(tableView)
        }
        func configViews() {
            let homeConfigurator = HomeConfigurator()
            homeConfigurator.configureModuleForViewInput(viewInput: self)
        }
        func configTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(cellTypes: [TouristSiteTableViewCell.self])
            view.addSubview(tableView)
            tableView.snp.makeConstraints { (make) in
                make.edges.equalTo(self.view)
            }
            tableView.anchor(to: view)
            tableView.separatorStyle = .none
            tableView.backgroundColor = .white
            tableView.addPullToRefresh(refresher) { [weak self] in
                self?.output.reloadData()
            }
        }
        addSubviews()
        configTableView()
        configViews()
        output.viewIsReady()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        func initNaviBar() {
            if let naviVC = self.navigationController {
                naviVC.setNavigationBarHidden(true, animated: false)
            }
        }
        initNaviBar()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        if let topPullToRefresh = tableView.topPullToRefresh {
            tableView.removePullToRefresh(topPullToRefresh)
        }
    }
}

extension HomeViewController: HomeViewInput {
    func refreshViewModel(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.tableView.reloadData()
        Logger.logInfo(message: "refresh Tourist Site Result ")
    }
    
    func setupInitialState() {
        Logger.logInfo(message: "setup Initial State")
    }
    
    func refreshTouristSiteResult(result: TouristSiteResult) {
        Logger.logInfo(message: "refresh Tourist Site Result")
    }
    
    func loadDataSuccess() {
        Logger.logInfo(message: "load data success")
        tableView.endRefreshing(at: Position.top)
    }
}

extension HomeViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerCellHeight
    }
}

extension HomeViewController : UITableViewDataSource {
    
    private func generateHeaderView(title: String?) -> UIView {
        let view = UIView()
            .change(width: tableView.bounds.width)
            .change(height: headerCellHeight)
        let left = 16.cgFloat
        let label = UILabel()
            .changeFontSize(to: 12)
            .changeTextColor(to: AppColor.darkTextColor)
            .change(height: 12)
            .change(width: tableView.bounds.width - 2 * left)
            .move(10, pointsBottomToAndInside: view)
            .move(left, pointsLeadingToAndInside: view)
            .anchor(to: view)
        label.text = title
        return view
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return generateHeaderView(title: self.viewModel.listTitle)
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.listCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TouristSiteTableViewCell.self, for: indexPath)
        cell.viewModel = self.viewModel.list[indexPath.row]
        return cell
    }
    
}
