//
//  PostViewModel.swift
//  CodequestTestApp
//
//  Created by karol.nadratowski on 19/02/2021.
//

import Foundation




final class PostListViewModel {
    private let posts: [Post] = [
        Post(userId: 1, title: "title 1", body: "body 1"),
        Post(userId: 2, title: "title 2", body: "body 2")
    ]
    
    
    
    var numberOfRows: Int {
        return posts.count
    }
    
    func getPost(for row: Int) -> Post? {
        guard posts.indices.contains(row) else {
            return nil
        }
        
        return posts[row]
    }

}
