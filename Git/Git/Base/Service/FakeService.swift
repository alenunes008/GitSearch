//
//  FakeService.swift
//  Brasileirao
//
//  Created by anunes on 21/02/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import Foundation

class FakeService{
    func mockContentData(file: String) -> Data {
        return getData(name: file)
    }

    func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try! Data(contentsOf: fileUrl!)
        return data
    }

    func getMock<T:Decodable>(model: T.Type, file : Data) -> T?{
        do {
            let result = try JSONDecoder().decode(T.self, from: file)
            return result
        } catch { print(error) }
        return nil
    }
}

