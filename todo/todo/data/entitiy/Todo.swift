
import Foundation

class Todo {

    var todo_id : Int?
    var todo_mesaj : String?

    init(){


    }

    init(todo_id: Int, todo_mesaj: String) {
        self.todo_id = todo_id
        self.todo_mesaj = todo_mesaj
    }

}
