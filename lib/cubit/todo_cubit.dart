import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg2/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>>{
  TodoCubit():super([]);
  void addTodo(String name){
    if(name.isEmpty){
      addError('Todo cannot be empty');
      return;
    }
    final todo = Todo(name: name, createdAt: DateTime.now());
    emit([...state,todo]);
  }
  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print(change);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('TodoCubit - $error');
  }
}