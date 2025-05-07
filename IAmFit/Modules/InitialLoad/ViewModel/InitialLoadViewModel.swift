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
    @Published var isFormValid: Bool = false
    
    init() {
        setupPublisher()
    }
  
    var validationPunisher: AnyPublisher<Bool, Never> {
        $userForm.map { form in
            return !form.name.isEmpty
            && !form.height.isEmpty
            && !form.weight.isEmpty
            && !form.age.isEmpty
            && Int(form.age) != nil
            && Double(form.height) != nil
            && Double(form.weight) != nil
        }
        .eraseToAnyPublisher()
    }
    
    var cancellables: Set<AnyCancellable> = []
    
    func setupPublisher() {
        validationPunisher
            .receive(on: RunLoop.main)
            .sink { val in
                self.isFormValid = val
            }
            .store(in: &cancellables)
    }
    func buttonHanderSubmit() -> Future<Void, CoreDataError> {
        let user = UserInfoPO(name: userForm.name, age: Double(userForm.age), height: Double(userForm.height), weight: Double(userForm.weight))
        return CoreDataManager.shared.saveUser(user: user)
    }
    
}
