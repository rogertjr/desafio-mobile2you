//
//  String+Ext.swift
//  Desafio M2Y
//
//  Created by Mobile2you on 15/03/21.
//

import Foundation

extension String {
    var onlyYear: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
