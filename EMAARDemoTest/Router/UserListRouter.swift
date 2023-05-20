//
//  UserListRouter.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

import Foundation

protocol UserListRouterProtocol {
    func showUserDetail(for viewModel: UserDetailViewModel)
}

class UserListRouter: UserListRouterProtocol {
    
    let presentingViewController: UIViewController
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    static var mainstoryboard: UIStoryboard{
            return UIStoryboard(name:"Main",bundle: Bundle.main)
        }
    
    func showUserDetail(for viewModel: UserDetailViewModel) {
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userDetailViewController: DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        userDetailViewController.detailViewModel = viewModel
        
        navigationController.pushViewController(userDetailViewController, animated: true)
    }
}
