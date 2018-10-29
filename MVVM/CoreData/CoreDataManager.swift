//
//  CoreDataManager.swift
//  MVVM
//
//  Created by Karlo Pagtakhan on 10/26/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import Foundation
import CoreData

protocol DataProvider {
//    func save()
//    func resetData()
//    func fetchOnlineOrders() -> [OnlineOrder]
}

//class MockDataManager: DataProvider {
//
//}

class CoreDataManager: DataProvider {

    static let model: NSManagedObjectModel = {
        let bundle = Bundle(for: CoreDataManager.self)
        let modelURL = bundle.url(forResource: "MVVM", withExtension: "momd")
        let model = NSManagedObjectModel(contentsOf: modelURL!)
        return model!
    }()

    let container: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }

    init(container: NSPersistentContainer? = nil) {
        if let container = container {
            self.container = container
        } else {

            let container = NSPersistentContainer(name: "MVVM")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })

            self.container = container

            if self.fetchOnlineOrders().count == 0 {
                self.createOnlineOrders()
            }
        }
    }

    func save() {
        try? container.viewContext.save()
    }


    func resetData() {
        deleteAllOnlineOrders()
        createOnlineOrders()

    }

    func createOnlineOrders() {
        [(10, 1560),
         (11, 895),
         (12, 1675),
         (13, 399),
         (14, 129)].forEach {
            print($0)
            let onlineOrder = OnlineOrder(context: container.viewContext)
            onlineOrder.uuid = UUID().uuidString
            onlineOrder.orderNumber = Int64($0.0)
            onlineOrder.amount = Int64($0.1)
            onlineOrder.isAccepted = false

            try? container.viewContext.save()
        }
    }

    func deleteAllOnlineOrders() {
        let existingOnlineOrders = fetchOnlineOrders()
        existingOnlineOrders.forEach { container.viewContext.delete($0) }

        try? container.viewContext.save()
    }


    func fetchOnlineOrders() -> [OnlineOrder] {
        let fetchRequest = NSFetchRequest<OnlineOrder>(entityName: "OnlineOrder")
        let onlineOrders = try? container.viewContext.fetch(fetchRequest)

        return onlineOrders ?? []
    }
}
