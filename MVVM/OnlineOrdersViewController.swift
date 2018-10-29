//
//  OnlineOrdersViewController.swift
//  MVVM
//
//  Created by Karlo Pagtakhan on 10/26/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit
import CoreData


class OnlineOrdersViewController: UIViewController {

    //MARK:- @IBOutlet
    @IBOutlet var collectionView: UICollectionView!

    //MARK:- Instance properties
    var coreDataManager = CoreDataManager()
    var pendingOnlineOrders: [OnlineOrder] = []
    var acceptedOnlineOrders: [OnlineOrder] = []


//    lazy var viewModel = { OnlineOrdersViewModel(coreDataManager: coreDataManager) }()

    //MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()


        title = "Online Orders"
        setupNavigationController()
        setupCollectionView()

//        viewModel.onRefresh = {
//            self.collectionView.reloadData()
//        }

    }

    @IBAction func resetData(_ sender: Any) {
        coreDataManager.resetData()
        refreshData()
    }
}

//MARK:- Private methods
private extension OnlineOrdersViewController {
    func refreshData() {
        fetchOnlineOrders()
        collectionView.reloadData()
    }

    func fetchOnlineOrders() {
        let onlineOrders = coreDataManager.fetchOnlineOrders()

        pendingOnlineOrders = onlineOrders.filter { !$0.isAccepted}
        acceptedOnlineOrders = onlineOrders.filter { $0.isAccepted}
    }

    func items(forSection section: Int) -> Int {
        if section == 0 {
            return pendingOnlineOrders.count
        } else {
            return acceptedOnlineOrders.count
        }
    }

    func headerCount(forSection section: Int) -> String {
        if section == 0 {
            return String(pendingOnlineOrders.count) + " items"
        } else {
            return String(acceptedOnlineOrders.count) + " items"
        }
    }

    func headerText(forSection section: Int) -> String {
        if section == 0 {
            return "Pending"
        } else {
            return "Accepted"
        }
    }

    func accept(row: Int) {
        pendingOnlineOrders[row].isAccepted = true
        try? coreDataManager.viewContext.save()
    }

    func decline(row: Int) {
        pendingOnlineOrders[row].isAccepted = true
        coreDataManager.viewContext.delete(pendingOnlineOrders[row])
        try? coreDataManager.viewContext.save()
    }
}

//MARK:- UICollectionViewDelegate, UICollectionViewDataSource
extension OnlineOrdersViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as! CustomCollectionViewCell

        let onlineOrder: OnlineOrder
        let isPendingSection = indexPath.section == 0

        if isPendingSection {
            onlineOrder = pendingOnlineOrders[indexPath.row]
        } else {
            onlineOrder = acceptedOnlineOrders[indexPath.row]
        }


        cell.orderLabel?.text = "Order #\(onlineOrder.orderNumber.toString())"
        cell.amountLabel?.text = "Total: \(onlineOrder.amount.formattedCurrency())"
        cell.isActionEnabled = isPendingSection

        cell.onAccept = { [weak self, indexPath] in
            self?.accept(row: indexPath.row)
            self?.refreshData()
        }

        cell.onDecline = { [weak self, indexPath] in
            self?.decline(row: indexPath.row)
            self?.refreshData()
        }

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items(forSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.reuseIdentifier, for: indexPath) as! CollectionReusableView

        view.label.text = headerText(forSection: indexPath.section)
        view.countLabel.text = headerCount(forSection: indexPath.section)
        
        view.backgroundColor = .lightGray
        return view
    }
}


