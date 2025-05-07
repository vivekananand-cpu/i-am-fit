//
//  User+CoreDataProperties.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Double
    @NSManaged public var height: Double
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var weight: Double
    @NSManaged public var has_performed_exercises: NSSet?

}

// MARK: Generated accessors for has_performed_exercises
extension User {

    @objc(addHas_performed_exercisesObject:)
    @NSManaged public func addToHas_performed_exercises(_ value: Exercise)

    @objc(removeHas_performed_exercisesObject:)
    @NSManaged public func removeFromHas_performed_exercises(_ value: Exercise)

    @objc(addHas_performed_exercises:)
    @NSManaged public func addToHas_performed_exercises(_ values: NSSet)

    @objc(removeHas_performed_exercises:)
    @NSManaged public func removeFromHas_performed_exercises(_ values: NSSet)

}

extension User : Identifiable {

}
