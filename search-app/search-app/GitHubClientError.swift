//
//  GitHubClientError.swift
//  search-app
//
//  Created by 田代創大 on 2019/10/14.
//  Copyright © 2019 田代創大. All rights reserved.
//
enum GitHubClientError : Error {
    case connectionError(Error)
    case responseParseError(Error)
    case apiError(GitHubAPIError)
}
