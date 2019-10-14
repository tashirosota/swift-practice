//
//  Repository.swift
//  search-app
//
//  Created by 田代創大 on 2019/10/14.
//  Copyright © 2019 田代創大. All rights reserved.
//

struct Repository : Decodable{
    let id: Int
    let name: String
    let fullName: String
    let owner: User
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
    }
}
