//
//  OnlineOrdersViewModel.swift
//  MVVM
//
//  Created by Karlo Pagtakhan on 10/27/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit
import CoreData

class OnlineOrdersViewModel {

    //MARK:- PresentaionModel
    struct OnlineOrderPresentationModel {
        var orderNumber: String
        var amount: String
        var objectID: NSManagedObjectID
        var isActionable: Bool

        init(orderNumber: Int64, amount: Int64, objectID: NSManagedObjectID, isActionable: Bool = true) {
            self.orderNumber = "Order #: \(orderNumber)"
            self.amount = "Total: \(amount.formattedCurrency())"
            self.objectID = objectID
            self.isActionable = isActionable
        }
    }

    //MARK:- Public Instance properties
    let numberOfSections = 2
    var onRefresh: (() -> ())?

    //MARK:- Private Instance properties
    private var allOnlineOrders: [OnlineOrder] = []
    private var coreDataManager: CoreDataManager
    private var pendingOnlineOrders: [OnlineOrderPresentationModel] = []
    private var acceptedOnlineOrders: [OnlineOrderPresentationModel] = []

    //MARK:- Initializers
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
        self.fetchOnlineOrders()
    }

    //MARK:- Public methods
    func onlineOrder(forIndexPath indexPath: IndexPath) -> OnlineOrderPresentationModel {
        if indexPath.section == 0 {
            return pendingOnlineOrders[indexPath.row]
        } else {
            return acceptedOnlineOrders[indexPath.row]
        }
    }

    //ADD CODE HERE

}

private extension OnlineOrdersViewModel {
    
    func fetchOnlineOrders() {
        allOnlineOrders = coreDataManager.fetchOnlineOrders()
        
        pendingOnlineOrders = allOnlineOrders
            .filter { !$0.isAccepted}
            .map { OnlineOrderPresentationModel(orderNumber: $0.orderNumber, amount: $0.amount, objectID: $0.objectID)
                
        }
        acceptedOnlineOrders = allOnlineOrders
            .filter { $0.isAccepted}
            .map { OnlineOrderPresentationModel(orderNumber: $0.orderNumber, amount: $0.amount, objectID: $0.objectID, isActionable: false)}
    }
    
    func onlineOrder(withobjectID objectID: NSManagedObjectID) throws -> OnlineOrder {
        let backingObject = allOnlineOrders.filter { $0.objectID == objectID }.first
        guard let onlineOrder = backingObject else {
            throw "Unable to find online order"
        }

        return onlineOrder
    }
}
