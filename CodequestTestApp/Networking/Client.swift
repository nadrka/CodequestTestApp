import Foundation

enum ApiError: Error {
    case cannotDecodeOutput
    case noData
    case invalidPath
}

final class Client {
    
    private let baseUrl: String
    
    init(baseUrl: String = "https://jsonplaceholder.typicode.com/") {
        self.baseUrl = baseUrl
    }
    func call<O: Decodable>(type: O.Type, endpoint: Endpoint, completion: @escaping (_ result: Result<O, Error>) -> Void ){
        guard let request = self.createUrlRequest(for: endpoint) else {
            completion(.failure(ApiError.invalidPath))
            return
        }

        let session = URLSession(configuration: .default)

        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }

            do {
                let output = try JSONDecoder().decode(O.self, from: data)
                completion(.success(output))
            } catch let jsonError {
                print(jsonError)
                completion(.failure(ApiError.cannotDecodeOutput))

            }
        }

        dataTask.resume()
    }


    private func createUrlRequest(for endpoint: Endpoint) -> URLRequest? {
        guard let url = endpoint.url(with: baseUrl) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod.rawValue

        return urlRequest
    }


}
