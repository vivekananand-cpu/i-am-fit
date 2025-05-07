//
//  ReportsViewModel.swift
//  IAmFit
//
//  Created by Vivek Thorat on 07/05/25.
//

import Foundation
import Combine

class ReportsViewModel: ObservableObject {
    
    @Published var reportsPO: ReportsPO = ReportsPO(model: [])
    var anyCancelable: Set<AnyCancellable> = []
    
    func fetchReportsData() {
        CoreDataManager.shared.fetchReportsData()
            .receive(on: RunLoop.main)
            .sink { completion in
                
            } receiveValue: { reportsPO in
                self.reportsPO = reportsPO
            }
            .store(in: &anyCancelable)

    }
}
