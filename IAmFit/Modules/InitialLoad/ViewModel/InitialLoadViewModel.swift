//
//  InitialLoadViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import Foundation
import Combine

class InitialLoadViewModel: ObservableObject {
    @Published var userForm: UserForm = UserForm()
    
    var cancellables: Set<AnyCancellable> = []
    
    
    func buttonHanderSubmit() -> Future<Void, CoreDataError> {
        let user = UserInfoPO(name: userForm.name, age: Double(userForm.age), height: Double(userForm.height), weight: Double(userForm.weight))
        return CoreDataManager.shared.saveUser(user: user)
    }
    
}
