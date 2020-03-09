//
//  API.swift
//  Git
//
//  Created by anunes on 06/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import UIKit

class API{

    static func getUsers(_ onComplete:@escaping(Result<GitModel,Error>) -> Void) {
        if let url = URL(string: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1 ") {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    guard let data = data else { return }
                    if let dictJson = self.parseDataToDictionary(data) {
                        if let model = try? JSONDecoder().decode(GitModel.self, from: JSONSerialization.data(withJSONObject: dictJson, options: .prettyPrinted)) {
                            onComplete(.success(model))
                        }
                    }
                } else {
                    onComplete(.failure(error!))
                }
            }
            dataTask.resume()
        }
    }

    private static func parseDataToDictionary(_ data:Data) -> [String: Any]? {

        if let dictJson = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
            return dictJson
        }
        return nil
    }
}
