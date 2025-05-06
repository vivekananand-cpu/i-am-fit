//
//  ProfileView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 06/05/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        VStack {
            Text("Welcome \(viewModel.name)!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 20) {
                TextFieldRounded(label: "Name", text: $viewModel.name)
                TextFieldRounded(label: "Age", text: $viewModel.age)
                TextFieldRounded(label: "Weight(KG)", text: $viewModel.weight)
                TextFieldRounded(label: "Height(cm)", text: $viewModel.height)
                    
                Button {
                    viewModel.buttonHandlerUpdateProfile()
                    
                } label: {
                    Text("Update Profile")
                }
                .padding(.top, 10)
                

                    
            }
            
            Spacer()
            
        }
        .onAppear {
            viewModel.fetchProfileData()
        }
        .alert("IAmFit", isPresented: $viewModel.updateUserAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(viewModel.alertMessage)
                }

    }
}

#Preview {
    ProfileView()
}
