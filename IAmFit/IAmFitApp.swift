//
//  IAmFitApp.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import SwiftUI

@main
struct IAmFitApp: App {
    @AppStorage("isUserExist") var isUserExist = false
    
    var body: some Scene {
        WindowGroup {
            if isUserExist {
                HomeTabView()
            } else {
                InitialLoadView()
            }
        }
    }
}
