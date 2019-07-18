//
//  Category.swift
//  App
//
//  Created by Michel Anderson Lutz Teixeira on 09/07/19.
//

import Foundation

/// A single entry of a Category list.
final class Category: Codable {
    /// The unique identifier for this `Category`.
    var id: Int?
    
    /// A title describing what this `Category` entails.
    var title: String
    
    /// A flag describing color `Category`.
    var color: String?
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String, color: String? = "") {
        self.id = id
        self.title = title
        self.color = color
    }
}

