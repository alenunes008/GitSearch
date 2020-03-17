//
//  GitModel.swift
//  Git
//
//  Created by anunes on 02/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import Foundation

// MARK: - GitModel
struct GitModel: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

// MARK: - Item
struct Item: Codable {
    let nodeID, name, fullName, description: String
    let forks, watchers: Int
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case description = "description"
        case forks = "forks_count"
        case watchers = "watchers_count"
        case owner = "owner"
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let avatarURL: String
    let identify: Int

    enum CodingKeys: String, CodingKey {
        case login
        case identify = "id"
        case avatarURL = "avatar_url"
    }
}
