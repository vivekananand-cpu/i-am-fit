//
//  InitialLoadViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import Foundation
import Combine

class InitialLoadViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    
    var cancellables: Set<AnyCancellable> = []
    
    
    func buttonHanderSubmit() -> Future<Void, CoreDataError> {
        let user = UserInfoPO(name: name, age: Double(age), height: Double(height), weight: Double(weight))
        return CoreDataManager.shared.saveUser(user: user)
    }
    
}
