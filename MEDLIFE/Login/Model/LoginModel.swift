//
//  LoginModel.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-04-07.
//

import SwiftUI

struct LoginCredentials: Identifiable, Codable, Hashable{
    var id: String
    var UTorID: String
    var password: String
}
