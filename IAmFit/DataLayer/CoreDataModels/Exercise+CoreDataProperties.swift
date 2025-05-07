//
//  Exercise+CoreDataProperties.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var duration: Double
    @NSManaged public var calories_burned: Double
    @NSManaged public var created_at: Date?
    @NSManaged public var updated_at: Date?
    @NSManaged public var belongs_to_user: User?

}

extension Exercise : Identifiable {

}
