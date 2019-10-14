//
//  main.swift
//  search-app
//
//  Created by 田代創大 on 2019/10/14.
//  Copyright © 2019 田代創大. All rights reserved.
//

import Foundation

guard let keyword = readLine(strippingNewline: true) else { exit(1) }

let client = GitHubClient()
let request = GitHubAPI.SearchRepositories(keyword: keyword)

client.send(request: request){ result in
    switch result {
    case let .success(response):
        for item in response.items {
            print(item.owner.login + "/" + item.name)
        }
        exit(0)
    case let .failure(error):
        print(error)
        exit(0)
    }
}

let timeoutInterval: TimeInterval = 60
Thread.sleep(forTimeInterval: timeoutInterval)
print("Connection timeout")
exit(1)

