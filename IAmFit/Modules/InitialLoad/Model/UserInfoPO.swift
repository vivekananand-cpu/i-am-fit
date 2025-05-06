//
//  UserInfoPO.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import Foundation

struct UserInfoPO {
    var name: String?
    var age: Double?
    var height: Double?
    var weight: Double?
    
    init(name: String?, age: Double?, height: Double?, weight: Double?) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
    }
    
    init(model: User) {
        self.name = model.name
        self.age = model.age
        self.height = model.height
        self.weight = model.weight
    }
}
