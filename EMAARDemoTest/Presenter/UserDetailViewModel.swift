//
//  UserDetailViewModel.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 19/05/23.
//

import Foundation

struct UserDetailViewModel {
    let fullName: String
    let email: String
    let dateOfJoining: String
    var formattedDateOfJoining: String {
        if let date = Date().dateWithFullMonthName(from: dateOfJoining) {
            return date
        } else {
            return dateOfJoining
        }
        
    }
    let dateOfBirth: String
    var formattedDateOfBirth: String {
        if let date = Date().dateWithShortMonthName(from: dateOfBirth) {
            return date
        } else {
            return dateOfBirth
        }
    }
    let age: String
    let largeImageURL: String
    let city: String
    let state: String
    let country: String
    let postcode: String
}
