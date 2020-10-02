//
//  Alo+CoreDataProperties.swift
//  GameOneViewTwo
//
//  Created by Ivan Dimitrov on 29.09.20.
//
//

import Foundation
import CoreData


extension Alo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alo> {
        return NSFetchRequest<Alo>(entityName: "Alo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var day: String?
    @NSManaged public var isOnArrow: Bool
    @NSManaged public var msg: String?
    @NSManaged public var symbol: Bool
    @NSManaged public var time: String?
    @NSManaged public var title: String?

}

extension Alo : Identifiable {

}
