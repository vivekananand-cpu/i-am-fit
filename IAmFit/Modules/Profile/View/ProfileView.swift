//
//  ProfileView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 06/05/25.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("isUserExist") var isUserExist = false
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        VStack {
            Text("Hello \(viewModel.name)!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 20) {
                TextFieldRounded(label: "Name", text: $viewModel.name)
                   
                TextFieldRounded(label: "Age", text: $viewModel.age)
                    .onChange(of: viewModel.age) { newValue in
                        viewModel.age = newValue.filter{ $0.isNumber}
                    }
                TextFieldRounded(label: "Weight(KG)", text: $viewModel.weight)
                    .onChange(of: viewModel.weight) { newValue in
                        viewModel.age = newValue.filter{ $0.isNumber}
                    }
                TextFieldRounded(label: "Height(cm)", text: $viewModel.height)
                    .onChange(of: viewModel.height) { newValue in
                        viewModel.age = newValue.filter{ $0.isNumber}
                    }
                
                VStack(spacing: 12) {
                    Button {
                        
                        viewModel.buttonHandlerUpdateProfile()
                        
                    } label: {
                        Text("Update Profile")
                            .foregroundStyle(.white)
                            .padding(4)
                            .background(
                                Color.red
                            )
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.deleteProfileAlert = true
                    } label: {
                        Text("Delete Profile")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .background(
                                Color.red
                            )
                    }
                }
                
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            viewModel.fetchProfileData()
        }
        .alert("IAmFit", isPresented: $viewModel.updateUserAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.alertMessage)
        }
        .alert("Are you sure you want to delete your profile?", isPresented: $viewModel.deleteProfileAlert) {
            Button("cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                deleteUser()
            }
        }
        
    }
}

extension ProfileView {
    func deleteUser() {
        viewModel.deleteUser()
            .receive(on: RunLoop.main)
            .sink { _ in
                isUserExist = false
            } receiveValue: { _ in
                
            }
            .store(in: &viewModel.cancellables)
        
    }
}

#Preview {
    ProfileView()
}
