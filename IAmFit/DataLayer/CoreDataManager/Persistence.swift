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
            if let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first {
                print("Core Data file path: \(url.path)")
            }
        }
    }
    
    func getRecords<T: NSManagedObject>(type: T.Type, condtion: String? = nil, args: Any...) -> [T] {
        let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: type))
//        request.returnsObjectsAsFaults = false
        if let condtion {
            let predicate = NSPredicate(format: condtion, argumentArray: args)
            request.predicate = predicate
        }
        do {
            return try managedObjectContext.fetch(request)
        } catch {
            print("Failed to fetch data: \(error.localizedDescription)")
            return []
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

//MARK: User operations
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
    
    func updateUser(user: UserInfoPO) -> Future<Void, CoreDataError> {
        return Future { [weak self] promise in
            guard let self else {
                return promise(.failure(.failure))
            }
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            let users = try? managedObjectContext.fetch(fetchRequest)
            if let managedObjUser = users?.first {
                managedObjUser.mapValues(userPO: user)
                saveContext()
                promise(.success(Void()))
            }
            return promise(.failure(.notFound))
        }
    }
    
    func deleteUser() -> Future<Void, CoreDataError> {
        return Future { [weak self] promise in
            guard let self else {
                return promise(.failure(.failure))
            }
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            let users = try? managedObjectContext.fetch(fetchRequest)
            if let managedObjUser = users?.first {
                managedObjectContext.delete(managedObjUser)
                saveContext()
            }
            return promise(.failure(.notFound))
        }
    }
    
    func getUser() -> Future<UserInfoPO?, CoreDataError> {
        return Future { [weak self] promise in
            guard let self else {
                return promise(.failure(.failure))
            }
            
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            do {
                let users = try self.managedObjectContext.fetch(fetchRequest)
                if users.isEmpty {
                    return promise(.failure(.notFound))
                }
                
                if let user = users.first {
                    return promise(.success(UserInfoPO(model: user)))
                }
                return promise(.failure(.notFound))
                
            } catch let error {
                return promise(.failure(.failure))
            }
        }
    }
    
    func isUserExist() -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let users = try managedObjectContext.fetch(fetchRequest)
            if users.isEmpty {
                return false
            }
            return true
        } catch {
            return false
        }
    }
}


//MARK: Exercise Operations

extension CoreDataManager {
    func insertExercise(exercise: ExercisePO)  {
        let startOfDay = Calendar.current.startOfDay(for: Date())
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay) ?? Date()
        self.managedObjectContext.perform {
            let allsRecords = self.getRecords(type: Exercise.self, condtion: "name = %@ AND (created_at > %@ AND created_at < %@)", args: exercise.type.title, startOfDay, endOfDay)
            let user = self.getRecords(type: User.self).first
            if let managedObjExercise = allsRecords.first {
                managedObjExercise.mapValues(model: exercise, user: user)
                managedObjExercise.updated_at = Date()
            } else {
                let newManagedObjExercise = Exercise(context: self.managedObjectContext)
                newManagedObjExercise.mapValues(model: exercise, user: user)
            }
            self.saveContext()
            
        }
    }
    
    func fetchReportsData() -> Future<ReportsPO, CoreDataError> {
        return Future {[weak self] promise in
            guard let self else {
                return promise(.failure(.failure))
            }
            
            let allRecords = getRecords(type: Exercise.self)
            return promise(.success(ReportsPO(model: allRecords)))
        }
    }
    
   
}
