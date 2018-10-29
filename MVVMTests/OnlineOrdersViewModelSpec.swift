//
//  OnlineOrdersViewModelSpec.swift
//  MVVMTests
//
//  Created by Karlo Pagtakhan on 10/27/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import XCTest
@testable import MVVM
import Quick
import Nimble
import CoreData

//class OnlineOrdersViewModelSpec: QuickSpec {
//
//    let pendingSection = 0
//
//    override func spec() {
//
//        var coreDataManager: CoreDataManager!
//        var sut: OnlineOrdersViewModel!
//
//
//        describe("OnlineOrdersViewModel") {
//
//            beforeEach {
//                print("Creating CoreDataManager")
//                let container = NSManagedObjectContext.makeTestingContainer()
//                coreDataManager = CoreDataManager(container: container)
//                sut = OnlineOrdersViewModel(coreDataManager: coreDataManager)
//            }
//
//
//            context("after being properly initialized") {
//
//                describe("headerText for section") {
//                    context("where section is 0") {
//                        it("returns Pending") {
//                            expect(sut.headerText(forSection: 0)).to(equal("Pending"))
//                        }
//                    }
//
//                    context("where section is 1") {
//                        it("returns Accepted") {
//                            expect(sut.headerText(forSection: 1)).to(equal("Accepted"))
//                        }
//                    }
//                }
//            }
//
//            describe("accept order") {
//                beforeEach {
//                    OnlineOrdersViewModelSpec.createOnlineOrders(pendingCount: 1, acceptedCount: 0, inContext: coreDataManager.viewContext)
//                    sut.refreshData()
//                }
//
//                context("where the row exists") {
//
//                    it("set isAccepted to true") {
//                        let selectedRow = 0
//                        try? sut.accept(row: selectedRow)
//
//                        let onlineOrderObjectID = sut.onlineOrder(forIndexPath: IndexPath(item: selectedRow, section: 0)).objectID
//                        let onlineOrder = coreDataManager.viewContext.object(with: onlineOrderObjectID) as! OnlineOrder
//
//                        expect(onlineOrder.isAccepted).to(beTrue())
//                    }
//                }
//
//                context("where the row DOES NOT exist") {
//                    it("throws an error") {
//                        expect { try sut.accept(row: 100) }.to(throwError())
//                    }
//                }
//            }
//
//            describe("decline order") {
//                beforeEach {
//                    OnlineOrdersViewModelSpec.createOnlineOrders(pendingCount: 1, acceptedCount: 0, inContext: coreDataManager.viewContext)
//                    sut.refreshData()
//                }
//
//                context("where the row exists") {
//                    it("deleted the managed object") {
//                        let selectedRow = 0
//                        try? sut.decline(row: selectedRow)
//
//                        let onlineOrderObjectID = sut.onlineOrder(forIndexPath: IndexPath(item: selectedRow, section: 0)).objectID
//                        let onlineOrder = try? coreDataManager.viewContext.existingObject(with: onlineOrderObjectID) as? OnlineOrder
//
//                        expect(onlineOrder).to(beNil())
//                    }
//                }
//
//                context("where the row DOES NOT exist") {
//                    it("throws an error") {
//                        expect { try sut.accept(row: 100) }.to(throwError())
//                    }
//                }
//            }
//
//            describe("refresh data") {
//                beforeEach {
//                    OnlineOrdersViewModelSpec.createOnlineOrders(pendingCount: 1, acceptedCount: 1, inContext: coreDataManager.viewContext)
//                }
//
//                context("where refresh is not called") {
//                    it("does not contain any online order"){
//
//                    }
//                }
//
//                context("where refresh is called") {
//                    it("does contain online orders"){
//
//                    }
//                }
//
//            }
//
//
//            describe("online order for indexpath") {
//            }
//
//            describe("items(forSection:) and headerCount(forSection:)") {
//
//                context("where there are 2 pending orders and 0 acccepted order") {
//
//                    beforeEach {
//                        OnlineOrdersViewModelSpec.createOnlineOrders(pendingCount: 2, acceptedCount: 0, inContext: coreDataManager.viewContext)
//                    }
//
//                    context("where section is 0") {
//
//                    }
//
//                    context("where section is 1") {
//
//                    }
//                }
//
//                context("where there is 0 pending orders and 2 acccepted orders") {
//
//                    beforeEach {
//                        OnlineOrdersViewModelSpec.createOnlineOrders(pendingCount: 0, acceptedCount: 2, inContext: coreDataManager.viewContext)
//                        sut.refreshData()
//                    }
//
//                    context("where section is 0") {
//
//                    }
//
//                    context("where section is 1") {
//
//                    }
//                }
//
//                context("where there is 1 pending order and 1 acccepted order") {
//
//                    beforeEach {
//                        OnlineOrdersViewModelSpec.createOnlineOrders(pendingCount: 1, acceptedCount: 1, inContext: coreDataManager.viewContext)
//                        sut.refreshData()
//                    }
//
//                    context("where section is 0") {
//
//                    }
//
//                    context("where section is 1") {
//
//                    }
//                }
//            }
//        }
//    }
}
