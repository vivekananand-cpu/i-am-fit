//
//  ProfileViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 06/05/25.
//

import Foundation
import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var updateUserAlert: Bool = false
    @Published var deleteProfileAlert: Bool = false
    
    @AppStorage("isUserExist") var isUserExist = false
    var alertMessage: String = "" {
        didSet {
            updateUserAlert = true
        }
    }
    
    var cancellables: Set<AnyCancellable> = []

    
    func fetchProfileData() {
        CoreDataManager.shared.getUser()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print(".finished")
                case .failure(let error):
                    print("error: \(error)")
                }
            } receiveValue: { user in
                self.assignUserData(user: user)
            }
            .store(in: &cancellables)

    }
    
    func assignUserData(user: UserInfoPO?) {
        guard let user else { return }
        self.name = user.name ?? ""
        self.age = String(user.age ?? 0)
        self.weight = String(user.weight ?? 0)
        self.height = String(user.height ?? 0)
    }
    
    func buttonHandlerUpdateProfile() {
        let user = UserInfoPO(name: name, age: Double(age), height: Double(height), weight: Double(weight))
        CoreDataManager.shared.updateUser(user: user)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.alertMessage = "Profile updated successfuly."
                    
                case .failure(let error):
                    self.alertMessage = "Failed to update profile."
                }
            } receiveValue: { _ in
                
            }
            .store(in: &cancellables)

    }
    
    func deleteUser() -> Future<Void, CoreDataError> {
        return CoreDataManager.shared.deleteUser()
    }
}
