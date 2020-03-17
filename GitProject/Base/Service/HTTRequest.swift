//
//  HTTRequest.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 14/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

enum ANResult<T> {
    case success(value: T)
}

struct HTTRequest<T: Decodable> {
    typealias HTTPNewtorkingSuccess = (T?)-> Swift.Void
    typealias HTTPNewtorkingFailure = (NSError)-> Swift.Void
    typealias HTTPNetworkingDataTask = (Data?, URLResponse?, Error?)-> Swift.Void
    typealias HTTPNetworkingDataTaskNew = (Data?)-> Swift.Void
    var requestable: HTTPRequestable

    func getNew(result: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: requestable.url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = requestable.headers
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        result(.success(json))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        print(error)
                    }
                }
            } else {
                //TRATAR ERRO
            }
        }
        session.resume()
    }

    public func encodeParams(params: [String: Any]) -> Data? {
        guard let jsonData = params.queryFormat().data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        return jsonData
    }
}
