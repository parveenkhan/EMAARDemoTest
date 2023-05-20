//
//  UserListPresenter.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

import Foundation

 protocol UserListPresenterProtocol: AnyObject {
     func showUserList(page: Int, _ completion: @escaping(_ userList: [UserPresenterViewModel]) -> Void)
    func showUserDetail(for viewModel: UserDetailViewModel)
}

class UserListPresenter: UserListPresenterProtocol {
   
    let interactor: UserListInteractor
    let router: UserListRouterProtocol
    
    init(interactor: UserListInteractor, router: UserListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func showUserList(page: Int, _ completion: @escaping(_ userList: [UserPresenterViewModel]) -> Void) {
        interactor.getUserList(page: page) { userList in
            guard let userList = userList else {
                completion([])
                return
            }
            completion(userList)
        }
    }
    
    func showUserDetail(for viewModel: UserDetailViewModel) {
        router.showUserDetail(for: viewModel)
    }
}
