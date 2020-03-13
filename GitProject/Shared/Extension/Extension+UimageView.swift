//
//  Extension+UimageView.swift
//  Santander
//
//  Created by anunes on 03/03/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }

    func loadImage(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadImage(from: url, contentMode: mode)
    }
}
