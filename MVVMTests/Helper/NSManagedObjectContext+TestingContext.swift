//
//  NSManagedObjectContext+TestingContext.swift
//  MVVMTests
//
//  Created by Karlo Pagtakhan on 10/28/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import Foundation
import CoreData
@testable import MVVM


extension NSManagedObjectContext {

    static func makeTestingContainer() -> NSPersistentContainer {
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.url = nil
        persistentStoreDescription.type = NSInMemoryStoreType

        let container = NSPersistentContainer(name: "TestingContainer", managedObjectModel: CoreDataManager.model)
        container.persistentStoreDescriptions = [persistentStoreDescription]

        container.loadPersistentStores(completionHandler: { _, _ in
        })

        return container
    }
}
