//
//  PostViewModel.swift
//  CodequestTestApp
//
//  Created by karol.nadratowski on 19/02/2021.
//

import Foundation


final class PostListViewModel {
    var onPostLoaded: (() -> ())? = nil
    var onFailure: (() -> ())? = nil
    
    private let postService: PostServiceProtocol
    private var posts: [Post] = []
    
    init(postService: PostServiceProtocol) {
        self.postService = postService
    }

    var numberOfRows: Int {
        return posts.count
    }
    
    func getPost(for row: Int) -> Post? {
        guard posts.indices.contains(row) else {
            return nil
        }
        
        return posts[row]
    }
    
    func fetchPosts() {
        postService.fetchPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.onPostLoaded?()
            case .failure(_):
                self?.onFailure?()
                
            }
        }
    }

}
