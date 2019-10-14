//
//  GitHubAPIError.swift
//  search-app
//
//  Created by 田代創大 on 2019/10/14.
//  Copyright © 2019 田代創大. All rights reserved.
//

struct GitHubAPIError : Decodable , Error {
    struct FieldError : Decodable {
        let response: String
        let field: String
        let code: String
    }
    let message: String
    let fieldErrors: [FieldError]
}
