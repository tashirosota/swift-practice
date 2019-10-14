//
//  GitHubAPI.swift
//  search-app
//
//  Created by 田代創大 on 2019/10/14.
//  Copyright © 2019 田代創大. All rights reserved.
//

import Foundation

final class GitHubAPI {
    struct SearchRepositories : GitHubRequest {
        let keyword: String
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod { return .get }
        var path: String { return "/search/repositories" }
        var queryItems: [URLQueryItem] { return [URLQueryItem(name: "q", value: keyword)]}
    }
    
    struct SearchUsers : GitHubRequest {
        let keyword: String
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod { return .get }
        var path: String { return "/search/users" }
        var queryItems: [URLQueryItem] { return [URLQueryItem(name: "q", value: keyword)]}
    }
}


