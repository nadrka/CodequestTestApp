import Quick
import Nimble

@testable import CodequestTestApp
class PostViewModelTests: QuickSpec {
    
    override func spec() {
        let fakePostService = FakePostService()
        let sut = PostListViewModel(postService: fakePostService)
        describe("PostViewModel") {
            beforeEach {
                sut.fetchPosts()
            }
            describe(" `numberOfrows` after fetch") {
                it(" should return correct number") {
                    expect(sut.numberOfRows).to(equal(2))
                }
            }
        
            describe(" getPost()") {
                context(" when row is in bounds") {
                    it(" should return correct post") {
                        expect(sut.getPost(for: 0)?.title).to(equal("title1"))
                    }
                }
                
                context(" when row is out of bounds") {
                    it(" should return nil") {
                        expect(sut.getPost(for: 3)).to(beNil())
                    }
                }
                
            }
            
        }
    }
    
}
