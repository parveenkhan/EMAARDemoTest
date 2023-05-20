//
//  UserListModel.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 18/05/23.
//

import Foundation

// MARK: - User List
struct User: Codable {
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
    }
    
    struct Street: Codable {
        let number: Int
        let name: String
    }
    
    struct Coordinates: Codable {
        let latitude: String
        let longitude: String
    }
    
    struct Timezone: Codable {
        let offset: String
        let description: String
    }
    
    struct Location: Codable {
        struct Street: Codable {
            let number: Int
            let name: String
        }
        
        let street: Street
        let city: String
        let state: String
        let country: String
        let postcode: Int
        let coordinates: Coordinates
        let timezone: Timezone
    }
    
    struct Login: Codable {
        let uuid: String
        let username: String
        let password: String
        let salt: String
        let md5: String
        let sha1: String
        let sha256: String
    }
    
    struct Dob: Codable {
        let date: String
        let age: Int
    }
    
    struct Registered: Codable {
        let date: String
        let age: Int
    }
    
    struct Id: Codable {
        let name: String
        let value: String?
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob: Dob
    let registered: Registered
    let phone: String
    let cell: String
    let id: Id
    let picture: Picture
    let nat: String
}

struct Results: Codable {
    let results: [User]
    
    private enum CodingKeys: String, CodingKey {
           case results
       }
}
