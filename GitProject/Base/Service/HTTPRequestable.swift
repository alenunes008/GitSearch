//
//  File.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 14/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

protocol HTTPRequestable: HTTPDomain {
    var path: String { get }
    var url: URL? { get }
    var queryString: String { get }
}

extension HTTPRequestable {
    var headers: [String: String] {
        ["Content-Type": "application/x-www-form-urlencoded"]
    }
}
