//
//  OnlineOrdersViewModelSpec+StaticHelper.swift
//  MVVMTests
//
//  Created by Karlo Pagtakhan on 10/28/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import XCTest
@testable import MVVM
import Quick
import Nimble
import CoreData

extension OnlineOrdersViewModelSpec {
    static func createOnlineOrders(pendingCount: Int, acceptedCount: Int, inContext context: NSManagedObjectContext) {
        var initialID = 10

        if pendingCount > 0 {
            (1...pendingCount).forEach { _ in
                let random = arc4random()

                let onlineOrderEntity = NSEntityDescription.entity(forEntityName: "OnlineOrder", in: context)!
                let onlineOrder = OnlineOrder(entity: onlineOrderEntity, insertInto: context)
                onlineOrder.uuid = UUID().uuidString
                onlineOrder.orderNumber = Int64(initialID)
                onlineOrder.amount = Int64(random)
                onlineOrder.isAccepted = false

                initialID = initialID + 1
            }
        }

        if acceptedCount > 0 {
            (1...acceptedCount).forEach { _ in
                let random = arc4random()

                let onlineOrderEntity = NSEntityDescription.entity(forEntityName: "OnlineOrder", in: context)!
                let onlineOrder = OnlineOrder(entity: onlineOrderEntity, insertInto: context)
                onlineOrder.uuid = UUID().uuidString
                onlineOrder.orderNumber = Int64(initialID)
                onlineOrder.amount = Int64(random)
                onlineOrder.isAccepted = false

                initialID = initialID + 1
            }
        }

        try? context.save()
    }
}
