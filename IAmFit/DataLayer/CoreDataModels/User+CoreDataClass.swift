//
//  User+CoreDataClass.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    func mapValues(userPO: UserInfoPO) {
        self.id = UUID().uuidString.lowercased()
        self.name = userPO.name
        self.age = userPO.age ?? 0.0
        self.height = userPO.height ?? 0.0
        self.weight = userPO.weight ?? 0.0
    }
}
