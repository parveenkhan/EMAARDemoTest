//
//  UserListPresenterWrapper.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 19/05/23.
//

import Foundation


class UserListPresenterWrapper: NSObject {
    
    private let presenter: UserListPresenterProtocol!
    typealias UserListCompletion = ([UserPresenterViewModel]) -> Void
    
   @objc init(viewController: UIViewController) {
        let interactor: UserListInteractor = UserListInteractor(apiService: NetworkService())
        presenter = UserListPresenter(interactor: interactor, router: UserListRouter(presentingViewController: viewController))
        super.init()
    }
    
    @objc func getUserList(page: Int, completion: @escaping UserListCompletion) {
        presenter.showUserList(page: page) { userList in
            completion(userList)
        }
    }
    
    @objc func showUserDetailScreen(viewModel: UserPresenterViewModel) {
        presenter.showUserDetail(for: createDetailViewModel(viewModel: viewModel))
    }
    
    
    @objc func getCountryFormatedText(_ text: String) -> NSString {
        return NSString(string: "country | \(text)")
    }
    
    @objc func getFormattedLoginStatus(dateString: String) -> NSString {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: dateString) {
            print(date)
            return date.formattedString() as NSString
        } else {
            print("Invalid date format")
            return "No Date"
        }
        
    }
    
    private func createDetailViewModel(viewModel: UserPresenterViewModel) -> UserDetailViewModel {
        
        return UserDetailViewModel(fullName: viewModel.fullName, email: viewModel.email, dateOfJoining: viewModel.dateOfJoining, dateOfBirth: viewModel.dateOfBirth, age: viewModel.age as String, largeImageURL: viewModel.largeImageURL, city: viewModel.city, state: viewModel.state, country: viewModel.country, postcode: viewModel.postcode)
    }
}
