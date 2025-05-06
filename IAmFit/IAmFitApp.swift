//
//  IAmFitApp.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

@main
struct IAmFitApp: App {

    @StateObject var viewModel = InitialLoadViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isUserExist {
                HomeTabView()
            } else {
                InitialLoadView(viewModel: viewModel)
            }
        }
    }
}
