//
//  DateFormatter.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 22.04.2023.
//

import Foundation

extension DateFormatter {
    func defaultFormat() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }
}
