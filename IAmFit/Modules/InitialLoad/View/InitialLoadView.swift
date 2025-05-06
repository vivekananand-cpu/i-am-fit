//
//  InitialLoadView.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

struct InitialLoadView: View {
    @StateObject var viewModel = InitialLoadViewModel()
    var body: some View {
        VStack {
            Text("Welcome to IAmFit!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 20) {
                TextFieldRounded(label: "Name", text: $viewModel.name)
                TextFieldRounded(label: "Age", text: $viewModel.age)
                TextFieldRounded(label: "Weight(KG)", text: $viewModel.weight)
                TextFieldRounded(label: "Height(cm)", text: $viewModel.height)
                    
                Button {
                    viewModel.handleUserSaved()
                    
                } label: {
                    Text("Submit")
                }
                .padding(.top, 10)
                

                    
            }
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    InitialLoadView()
}
