import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg2/cubit/todo_cubit.dart';

import 'models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoCubit,List<Todo>>(
        
        builder: (context,todos) {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(todos[index].name),
            ),
            itemCount: todos.length,
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
