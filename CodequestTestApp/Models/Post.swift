import Foundation

class Post: Decodable {
    private(set) var userId: Int
    private(set) var title: String
    private(set) var body: String
    
    init(userId: Int, title: String, body: String) {
        self.userId = userId
        self.title = title
        self.body = body
    }
}
