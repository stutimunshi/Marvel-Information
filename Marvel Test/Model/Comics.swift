//
//  Comics.swift
//  Marvel Test
//
//  Created by Stuti Munshi on 2022-04-18.
//

import SwiftUI

struct resultOfComicAPI: Codable {
    var data: ComicDataAPI
}

struct ComicDataAPI: Codable {
    var count: Int
    var results: [Comics]
}

struct Comics : Identifiable, Codable {
    var id: Int
    var title: String
    var description: String?
    var thumbnail: [String:String]
    var urls: [[String: String]]
}
