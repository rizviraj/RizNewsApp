//
//  RZ_HomeViewModel.swift
//  RizNewsApp
//
//  Created by Admin on 10/5/19.
//  Copyright © 2019 RizviOrganization. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RZ_HomeViewModel {
    
    weak var coordinator: HomeCoordinator?

    let disposeBag = DisposeBag()
    
    var newsArray = [RZ_NewsViewModel]()
    var newsViewModelObj: BehaviorRelay<[RZ_NewsViewModel]> = BehaviorRelay(value: [RZ_NewsViewModel]())

    
    /* ==================================================
     Description    :   Use this method to load news table view cell
     Parameters     :   Tableview
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
     Description    :   Implement selected row in news headlines
     Parameters     :   selected index, view controller
     Return         :   nil
     ================================================== */
    func selectedNewsItem (_ selfView: UIViewController, _ tableView: UITableView) {
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                //let selectedNews = self!.newsArray[indexPath.row]
                let selectedNews = self?.newsViewModelObj.value[indexPath.row]
                self?.coordinator?.newsDetailView(selectedNews!)
                
            }).disposed(by: disposeBag)
    }
    
    func searchNews (_ searchBar : UISearchBar)  {
        searchBar.rx.text
            .orEmpty
            .subscribe({ query in
                let strng = query.element?.lowercased()
                self.newsViewModelObj.accept(self.newsArray.filter({$0.nw_title.lowercased().hasPrefix(strng!)}))
            }).disposed(by: disposeBag)
    }
}
