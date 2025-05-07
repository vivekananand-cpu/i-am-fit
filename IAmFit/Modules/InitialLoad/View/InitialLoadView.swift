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
                    .onChange(of: viewModel.userForm.age) { newValue in
                        viewModel.userForm.age = newValue.filter { $0.isNumber }
                    }
                TextFieldRounded(label: "Weight(KG)", text: $viewModel.userForm.weight)
                    .onChange(of: viewModel.userForm.weight) { newValue in
                        viewModel.userForm.weight = newValue.filter { $0.isNumber }
                    }
                TextFieldRounded(label: "Height(cm)", text: $viewModel.userForm.height)
                    .onChange(of: viewModel.userForm.height) { newValue in
                        viewModel.userForm.height = newValue.filter { $0.isNumber }
                    }
                    
                Button {
                    handleSubmit()
                    
                }
                label: {
                    let bgColor = viewModel.isFormValid ? Color.red : Color.gray
                    Text("Submit")
                        .foregroundStyle(.white)
                        .padding(4)
                        .background(
                            bgColor
                        )
                        .cornerRadius(8)
                }
                .disabled(!viewModel.isFormValid)
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
