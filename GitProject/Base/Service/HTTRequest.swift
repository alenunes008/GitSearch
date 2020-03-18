//
//  HTTRequest.swift
//  TesteiOSv2
//
//  Created by Alex Nunes da Silva on 14/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

struct HTTRequest<T: Decodable> {
    var requestable: HTTPRequestable

    func get(result: @escaping (Result<T, Error>) -> Void) {
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
                } catch {
                    DispatchQueue.main.async {
                        result(.failure(error))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    result(.failure(NSError(domain: "Erro na requisição ao serviço", code: 500, userInfo: nil)))
                }
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
