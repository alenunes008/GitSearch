//
//  Extension+Date.swift
//  Brasileirao
//
//  Created by anunes on 26/02/20.
//  Copyright © 2020 Santander Tecnologia. All rights reserved.
//

import Foundation

extension String {
    
    func date(dateFormat: String = "yyyy/MM/dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.timeZone = TimeZone(identifier: "America/Sao_Paulo")
        
        return dateFormatter.date(from: self)
    }
    
    func formatDate(strDate: String)-> String{
        return strDate.date(dateFormat: "dd/mm/yyyy HH:mm:ss")?
            .string(dateFormat: "EEE, dd \'de' MMMM - HH:mm") ?? "-"
    }

    func formatPlacar(strPlacar: String)-> [String]{
        return strPlacar.components(separatedBy: "x")
    }


}
