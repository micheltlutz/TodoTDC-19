import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get { req in
        return "Olá TDC 2019 São Paulo "
    }
    
    router.get("ping") { req in
        return "pong"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    let categoryController = CategoryController()
    router.get("category", use: categoryController.index)
    router.post("category", use: categoryController.create)
    router.delete("category", Category.parameter, use: categoryController.delete)
}
