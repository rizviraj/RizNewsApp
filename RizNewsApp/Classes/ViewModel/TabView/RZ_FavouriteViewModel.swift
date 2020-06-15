//
//  RZ_FavouriteViewModel.swift
//  RizNewsApp
//
//  Created by Admin on 10/5/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class RZ_FavouriteViewModel {
    
    weak var coordinator: FavouriteCoordinator?

    let disposeBag = DisposeBag()
    var newsArray = [RZ_NewsViewModel]()
    var newsViewModelObj: BehaviorRelay<[RZ_NewsViewModel]> = BehaviorRelay(value: [RZ_NewsViewModel]())

    
    /* ==================================================
     Description    :   Use this method to load table view cell
     Parameters     :   tableview
     Return         :   Nil
     ================================================== */
    func setupTableCell (_ tableView: UITableView) {
        newsViewModelObj.asObservable()
            .bind(to: tableView
                .rx
                .items(cellIdentifier: RZ_NewsTableCell.identifier, cellType: RZ_NewsTableCell.self)) {
                    (row, newsViewModel, cell) in
                    cell.separatorInset.left = 105
                    cell.newsViewModel = newsViewModel
            }.disposed(by: disposeBag)
    }
    
    /* ==================================================
     Description    :   Implement selected row in favourtie news
     Parameters     :   selected index, view controller
     Return         :   nil
     ================================================== */
    func selectedNewsItem (_ selfView: UIViewController, _ tableView: UITableView) {
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let selectedNews = self!.newsArray[indexPath.row]
                self?.coordinator?.newsDetailView(selectedNews)
            
            }).disposed(by: disposeBag)
    }
    /*
    func selectedNewsItem_1 (_ selfView: UIViewController, _ tableView: UITableView) {
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let detailView = RZ_NewsDetailView()
                let selectedNews = self!.newsArray[indexPath.row]
                detailView.newsViewModel = selectedNews
                detailView.newsDetailViewModel?.delegate = self as! NewsDetailViewDelegate
                //detailView.delegate = (selfView as! NewsDetailViewDelegate)
                selfView.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
                selfView.navigationController?.pushViewController(detailView, animated: false)
            }).disposed(by: disposeBag)
    }*/
}
