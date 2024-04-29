import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var task: String
}

struct TodoListView: View {

    
    @State private var todoItems = [
        TodoItem(task: "Created by Ashish"),
        TodoItem(task: "My first project"),
        
    ]
    @State private var newTask = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(todoItems) { item in
                        Text(item.task)
                    }
                    .onDelete(perform: deleteTodo)
                }
                .navigationBarTitle("Todo List")
                
                HStack {
                    TextField("New task", text: $newTask)
                    Button(action: addTodo) {
                        Text("Add")
                    }
                }
                .padding()
            }
        }
    }
    
    func addTodo() {
        let trimmedTask = newTask.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTask.isEmpty else { return }
        
        let newTodo = TodoItem(task: trimmedTask)
        todoItems.append(newTodo)
        newTask = ""
    }
    
    func deleteTodo(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
