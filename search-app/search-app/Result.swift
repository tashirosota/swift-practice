//
//  Result.swift
//  search-app
//
//  Created by 田代創大 on 2019/10/14.
//  Copyright © 2019 田代創大. All rights reserved.
//

import Foundation

enum Result<T, Error : Swift.Error>{
    case success(T)
    case failure(Error)
    
    init(value: T){
        self = .success(value)
    }
    
    init(error: Error){
        self = .failure(error)
    }
}
