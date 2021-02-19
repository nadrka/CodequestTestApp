//
//  File.swift
//  CodequestTestApp
//
//  Created by karol.nadratowski on 19/02/2021.
//

import Foundation


struct Endpoint {
    enum HttpMethod: String {
        case get = "GET"
    }
    let path: String
    let httpMethod: HttpMethod
 
    var url: URL? {
        return URL(string: path)
    }
}
