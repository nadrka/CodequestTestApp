//
//  PostService.swift
//  CodequestTestApp
//
//  Created by karol.nadratowski on 19/02/2021.
//

import Foundation

protocol PostServiceProtocol {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> ())
}

class PostService: PostServiceProtocol {
    private let client: Client
    
    init(client: Client = Client()) {
        self.client = client
    }
    
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
        let endpoint = API.getPosts()
        
        client.call(type: [Post].self, endpoint: endpoint, completion: completion)
    }
}
