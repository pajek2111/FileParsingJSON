//
//  NewsFeed.swift
//  FileParsingJSON
//
//  Created by Urban_MacOS on 07/12/2020.
//

import Foundation

struct Post: Codable {
    var status: String!
    var data: [Article]
}
