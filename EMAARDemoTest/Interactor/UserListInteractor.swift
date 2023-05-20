//
//  UserListInteractor.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

import Foundation

protocol UserListInteractorProtocol {
    func getUserList(page: Int, _ completion: @escaping (_ userList: [UserPresenterViewModel]?) -> Void)
}

class UserListInteractor: UserListInteractorProtocol {
    
    let apiService: UserListDataSourceProtocol
    private let coreDataManager: UserCoreDataManager
    
    init(apiService: UserListDataSourceProtocol) {
        self.apiService = apiService
        let context = CoreDataStack.shared.context
        self.coreDataManager = UserCoreDataManager(context: context)
    }
    
    func getUserList(page: Int, _ completion: @escaping (_ userList: [UserPresenterViewModel]?) -> Void) {
        
        fetchLocalUserList { users in
            if let userList = users, userList.count > 0 {
                completion(userList)
            } else {
                self.apiService.getUserList(page: page) { success, results, error in
                    if success, let userList = results {
                        self.saveUserListFromServer(userList)
                        let userViewModel = userList.map { userInfo in
                            return UserPresenterViewModel(
                                firstName: userInfo.name.first,
                                lastName: userInfo.name.last,
                                email: userInfo.email,
                                dateOfJoining: userInfo.registered.date,
                                dateOfBirth: userInfo.dob.date,
                                age: String(userInfo.dob.age),
                                largeImageURL: userInfo.picture.large,
                                mediumImageURL:userInfo.picture.medium,
                                thumbnailImageURL: userInfo.picture.thumbnail,
                                city: userInfo.location.city,
                                state: userInfo.location.state,
                                country: userInfo.location.country,
                                postcode: String(userInfo.location.postcode)
                            )
                        }
                        completion(userViewModel)
                    } else {
                        completion([])
                    }
                }
                
            }
        }
        
    }
    
   private func saveUserListFromServer(_ userListData: [User]) {

        coreDataManager.saveUserList(userListData)
    }
    
    private func fetchLocalUserList(_ completion: @escaping (_ userList: [UserPresenterViewModel]?) -> Void) {
        var presenterViewModel: [UserPresenterViewModel] = []
        let users = coreDataManager.fetchUserList()
        for userLocal in users {
            let viewModel = UserPresenterViewModel()
            viewModel.fullName = userLocal.fullName ?? ""
            viewModel.email = userLocal.email ?? ""
            viewModel.postcode = userLocal.postcode ?? ""
            viewModel.country = userLocal.country ?? ""
            viewModel.age = userLocal.age as NSString? ?? ""
            viewModel.state = userLocal.state ?? ""
            viewModel.city = userLocal.city ?? ""
            viewModel.thumbnailImageURL = userLocal.thumbnailImageURL ?? ""
            viewModel.mediumImageURL = userLocal.mediumImageURL ?? ""
            viewModel.largeImageURL = userLocal.largeImageURL ?? ""
            viewModel.dateOfBirth =  userLocal.dateOfBirth ?? ""
            viewModel.dateOfJoining =  userLocal.dateOfJoining ?? ""
            presenterViewModel.append(viewModel)
        }
        completion(presenterViewModel)
    }
    
    func getImageData(image: String) {
        
    }
}
