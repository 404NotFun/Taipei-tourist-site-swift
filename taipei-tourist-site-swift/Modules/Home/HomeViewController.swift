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
    private let loadMore = PullToRefresh()
    fileprivate lazy var tableView = UITableView.init(frame: CGRect.zero, style: .plain)
    fileprivate let headerCellHeight = 0.cgFloat
    fileprivate var current = 1
    fileprivate var loadable = false
    
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
                make.edges.equalToSuperview().inset(UIEdgeInsetsMake(44, 0, 0, 0))
            }
            tableView.estimatedRowHeight = 80
            tableView.separatorStyle = .none
            tableView.backgroundColor = .white
            loadMore.position = .bottom
            tableView.addPullToRefresh(refresher) { [weak self] in
                self?.output.reloadData()
            }
            tableView.addPullToRefresh(loadMore) { [weak self] in
                if (self?.loadable)! {
                    self?.current+=1
                    self?.output.loadMoreData(page: self?.current)
                }else {
                    self?.tableView.endRefreshing(at: .bottom)
                }
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
                AppConfig.setNavigationBarThemeDefault(naviVC)
            }
        }
        self.title = "台北市熱門景點"
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
    func loadMoreData(viewModels: [TouristSiteViewModel]) {
        self.viewModel.list.append(contentsOf: viewModels)
        self.viewModel.listCount += viewModels.count
        DispatchQueue.main.async {
            let lastScrollOffset = self.tableView.contentOffset
            self.tableView.reloadData()
            self.tableView.setContentOffset(lastScrollOffset, animated: true)
        }
    }
    
    func refreshViewModel(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupInitialState() {
        
    }
    
    func refreshTouristSiteResult(result: TouristSiteResult) {
        
    }
    
    func refreshDataResult(msg: String?) {
        tableView.endRefreshing(at: Position.top)
    }
    
    func loadDataResult(msg: String?) {
        tableView.endRefreshing(at: Position.bottom)
    }
}

extension HomeViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TouristSiteTableViewCell.self, for: indexPath)
        cell.viewModel = self.viewModel.list[indexPath.row]
        cell.contentLbl.delegate = self
        cell.layoutIfNeeded()
        cell.contentLbl.shouldCollapse = true
        cell.contentLbl.textReplacementType = .word
        cell.contentLbl.numberOfLines = 3
        cell.contentLbl.collapsed = self.viewModel.list[indexPath.row].collapse
        cell.imageCvCellViewModels = TtsHelper.splitFile(self.viewModel.list[indexPath.row].imageUrls).map({ ImageCvCellViewModel(imageUrl: $0) })
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.loadable = indexPath.row == self.viewModel.list.count - 1
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        let tvCell: TouristSiteTableViewCell? = self.tableView.cellForRow(at: IndexPath(row: collectionView.tag, section:0)) as? TouristSiteTableViewCell
        if tvCell != nil {
            return tvCell!.imageCvCellViewModels.count
        } else {
            return 0
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tvCell: TouristSiteTableViewCell? = self.tableView.cellForRow(at: IndexPath(row: collectionView.tag, section:0)) as? TouristSiteTableViewCell
        let cell = collectionView.dequeueReusableCell(with: ImageCollectionViewCell.self, for: indexPath)
        cell.viewModel = tvCell?.imageCvCellViewModels[indexPath.row]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: ImageCollectionViewCell? = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell
        if let vm = cell?.viewModel {
            self.output.presentDetail(imageViewModel: vm)
        }
    }
}

extension HomeViewController: ExpandableLabelDelegate {
    public func willCollapseLabel(_ label: ExpandableLabel) {
        
    }
    
    public func didCollapseLabel(_ label: ExpandableLabel) {
        
    }
    
    public func willExpandLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
    }
    
    public func didExpandLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            self.viewModel.list[indexPath.row].collapse = false
            DispatchQueue.main.async { [weak self] in
                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        self.tableView.endUpdates()
    }
}
