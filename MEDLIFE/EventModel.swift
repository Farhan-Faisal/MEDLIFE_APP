//
//  EventModel.swift
//  MEDLIFE
//
//  Created by Farhan Bin Faisal on 2023-01-15.
//

import SwiftUI

struct EventModel: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    var eventDate: Date
    var attendance: Int
    var location: String
    var description: String
}
