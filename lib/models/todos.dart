class Todo {
  final String id;
  final String todo;
  bool isDone;


  Todo({
    required this.todo,
    required this.id,
    this.isDone = false,
  });

  static List<Todo> todos (){
    return [
    Todo(todo: 'Learn How to do  clickble Index',id: '01'),
    Todo(todo: 'Go to church early tomorrow',id: '02'),
    Todo(todo: 'Learn How to cook fried rice', id: '03', isDone: true),
    Todo(todo: 'Play soccer t Nnewi High school', id: '04'),
    Todo(todo: 'Learn How to do  kitkat', id: '05',isDone: true),
    Todo(todo: 'Learn to speak respectfully publicly', id: '06'),
    ];
  }


}

