//
//  Characters.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-03-23.
//

import SwiftUI

struct resultOfAPI: Codable {
    var data: CharDataAPI
}

struct CharDataAPI: Codable {
    var count: Int
    var results: [Characters]
}

struct Characters: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String:String]
    var urls: [[String: String]]
}


