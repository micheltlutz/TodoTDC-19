import Foundation

/// A single entry of a Todo list.
final class Todo: Codable {
    /// The unique identifier for this `Todo`.
    var id: Int?
    
    /// A title describing what this `Todo` entails.
    var title: String
    
    /// A category describing what this `Todo`.
    var category: Category?
    
    /// A flag describing if this `Todo` is done.
    var done: Bool?
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String, category: Category?, done: Bool? = false) {
        self.id = id
        self.title = title
        self.category = category
        self.done = false
    }
}
