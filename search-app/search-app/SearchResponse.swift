//
//  SearchResponse.swift
//  search-app
//
//  Created by 田代創大 on 2019/10/14.
//  Copyright © 2019 田代創大. All rights reserved.
//

struct SearchResponse<Item : Decodable> : Decodable {
    let totalCount : Int
    let items : [Item]
    
    enum CodingKeys : String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
