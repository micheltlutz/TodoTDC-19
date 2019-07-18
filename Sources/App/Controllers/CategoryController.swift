//
//  CategoryController.swift
//  App
//
//  Created by Michel Anderson Lutz Teixeira on 10/07/19.
//

import Vapor
//import FluentPostgreSQL
import FluentSQLite

//Assing PostgreSQLModel on Category Model
//extension Category: PostgreSQLModel { }
extension Category: SQLiteModel { }

/// Allows `Category` to be used as a dynamic migration.
extension Category: Migration { }

/// Allows `Category` to be encoded to and decoded from HTTP messages.
extension Category: Content { }

/// Allows `Category` to be used as a dynamic parameter in route definitions.
extension Category: Parameter { }


/// Controls basic CRUD operations on `Category`s.
final class CategoryController {
    /// Returns a list of all `Category`s.
    func index(_ req: Request) throws -> Future<[Category]> {
        return Category.query(on: req).all()
    }
    
    /// Saves a decoded `Category` to the database.
    func create(_ req: Request) throws -> Future<Category> {
        return try req.content.decode(Category.self).flatMap { category in
            return category.save(on: req)
        }
    }
    
    /// Deletes a parameterized `Category`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Category.self).flatMap { category in
            return category.delete(on: req)
            }.transform(to: .ok)
    }
}
