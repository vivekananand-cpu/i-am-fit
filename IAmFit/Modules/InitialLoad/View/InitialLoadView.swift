//
//  InitialLoadView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

struct InitialLoadView: View {
    @AppStorage("isUserExist") var isUserExist = false
    @StateObject var viewModel: InitialLoadViewModel = InitialLoadViewModel()
    var body: some View {
        VStack {
            Text("Welcome to IAmFit!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 20) {
                TextFieldRounded(label: "Name", text: $viewModel.userForm.name)
                TextFieldRounded(label: "Age", text: $viewModel.userForm.age)
                TextFieldRounded(label: "Weight(KG)", text: $viewModel.userForm.weight)
                TextFieldRounded(label: "Height(cm)", text: $viewModel.userForm.height)
                    
                Button {
                    handleSubmit()
                    
                } label: {
                    Text("Submit")
                        .foregroundStyle(.white)
                        .padding(4)
                        .background(
                            Color.red
                        )
                        .cornerRadius(8)
                }
                .padding(.top, 10)
                

                    
            }
            
            Spacer()
            
        }
        .padding()
    }
}

extension InitialLoadView {
    func handleSubmit() {
        viewModel.buttonHanderSubmit()
            .receive(on: RunLoop.main)
            .sink { _ in
                isUserExist = true
            } receiveValue: { _ in
                
            }
            .store(in: &viewModel.cancellables)

    }
}

#Preview {
    InitialLoadView(viewModel: InitialLoadViewModel())
}
