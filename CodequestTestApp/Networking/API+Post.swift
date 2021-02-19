import Foundation

extension API {
    static func getPosts() -> Endpoint {
        return Endpoint(path: "posts", httpMethod: .get)
    }
}
