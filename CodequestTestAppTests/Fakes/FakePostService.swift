//
//  FakePostService.swift
//  CodequestTestAppTests
//
//  Created by karol.nadratowski on 19/02/2021.
//
@testable import CodequestTestApp

class FakePostService: PostServiceProtocol {
    let posts: [Post] = [
        Post(userId: 1, title: "title1", body: "body1"),
        Post(userId: 2, title: "title2", body: "body2"),
    ]
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
        completion(.success(posts))
    }
}
