//
//  NetworkServiceApi.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

import Foundation

enum NetworkServiceError: Error {
    case badUrl, requestError, decodingError, statusNotOK
}

struct NetworkService: UserListDataSourceProtocol {
    func getUserList(page: Int, _ completion: @escaping (_ success :Bool, _ results: [User]?, _ error: NetworkServiceError?) -> ()) {
        
        HttpRequestHelper().GET(url: ApiConstants.userListUrl, params: ["page":String(page), "results":"10", "seed": "abc"], httpHeader: .application_json) { success, data in
            
            if success {
          
                do {
                    let model = try JSONDecoder().decode(Results.self, from: data!)
                    print(model)
                    completion(true, model.results, nil)
                } catch {
                    completion(false, nil, .decodingError)
                }
                
            } else {
                completion(false, nil, .requestError)
            }
        }
        
    }
    
}
