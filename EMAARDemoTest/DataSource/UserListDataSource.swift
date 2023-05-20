//
//  UserListDataSource.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

import Foundation

protocol UserListDataSourceProtocol {
    func getUserList(page: Int, _ completion: @escaping (_ success :Bool, _ results: [User]?, _ error: NetworkServiceError?) -> ())
}
