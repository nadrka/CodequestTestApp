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
 
    func url(with baseUrl: String) -> URL? {
        return URL(string: baseUrl + path)
    }
}
