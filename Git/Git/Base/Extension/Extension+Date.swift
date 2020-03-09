//
//  Extension+Date.swift
//  Brasileirao
//
//  Created by anunes on 26/02/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import Foundation

extension Date {

    func string(dateFormat: String = "yyyy/MM/dd") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.timeZone = TimeZone(identifier: "America/Sao_Paulo")

        return dateFormatter.string(from: self)
    }
}
