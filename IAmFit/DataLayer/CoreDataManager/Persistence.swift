//
//  Persistence.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import CoreData
import Combine

enum CoreDataError: Error {
    case notFound
    case failure
}

class CoreDataManager: ObservableObject {
    static var shared: CoreDataManager = .init()
    let container = NSPersistentContainer(name: "IAmFit")
    var managedObjectContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init () {
        container.loadPersistentStores { description, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
        
    }
}


extension CoreDataManager {
    func saveUser(user: UserInfoPO) -> Future<Void, CoreDataError> {
        return Future { [weak self] promise in
            guard let self else {
                return promise(.failure(.failure))
            }
            
            let managedObjectUser = User(context: managedObjectContext)
            managedObjectUser.mapValues(userPO: user)
            saveContext()
            return promise(.success(Void()))
        }
    }
}
