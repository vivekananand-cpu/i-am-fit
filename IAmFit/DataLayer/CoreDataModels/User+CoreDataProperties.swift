//
//  User+CoreDataProperties.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var name: String?
    @NSManaged public var age: Double
    @NSManaged public var weight: Double
    @NSManaged public var height: Double
    @NSManaged public var id: String?

}

extension User : Identifiable {

}
