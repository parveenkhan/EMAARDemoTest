//
//  CoreDataManager.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 19/05/23.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EMAARDemoTest")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Failed to load persistent stores: \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Failed to save context: \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

class UserCoreDataManager {
    internal let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveUser(userData: UserPresenterViewModel) {
        guard let entity = NSEntityDescription.entity(forEntityName: "UserLocal", in: context) else {
            return
        }
        let user = UserLocal(entity: entity, insertInto: context)
        user.fullName = userData.fullName
        user.age = userData.age as String
        user.email = userData.email
        user.country = userData.country
        user.postcode = userData.postcode
        user.city = userData.city
        user.state = userData.state
        user.dateOfBirth = userData.dateOfBirth
        user.dateOfJoining = userData.dateOfJoining
        user.mediumImageURL = userData.mediumImageURL
        user.largeImageURL = userData.largeImageURL
        user.thumbnailImageURL = userData.thumbnailImageURL
       // user.profileImage = profileImage.jpegData(compressionQuality: 1.0)
        CoreDataStack.shared.saveContext()
    }
    
    func saveUserList(_ userList: [User]) {
        for userData in userList {
            guard let entity = NSEntityDescription.entity(forEntityName: "UserLocal", in: context) else {
                return
            }
            let user = UserLocal(entity: entity, insertInto: context)
            user.fullName = userData.name.first + userData.name.last
            user.age = String(userData.dob.age)
            user.email = userData.email
            user.country = userData.location.country
            user.postcode = String(userData.location.postcode)
            user.city = userData.location.city
            user.state = userData.location.state
            user.dateOfBirth = userData.dob.date
            user.dateOfJoining = userData.registered.date
            user.mediumImageURL = userData.picture.medium
            user.largeImageURL = userData.picture.large
            user.thumbnailImageURL = userData.picture.thumbnail
            
            context.insert(user)
        }
        CoreDataStack.shared.saveContext()
    }
    
    func fetchUserList() -> [UserLocal] {
        let fetchRequest: NSFetchRequest<UserLocal> = UserLocal.fetchRequest()
        do {
            let userList = try context.fetch(fetchRequest)
            return userList
        } catch {
            // Handle fetch error
            return []
        }
    }
    
}
