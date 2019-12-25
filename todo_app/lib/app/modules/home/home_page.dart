import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../shared/todo_model.dart';
import 'components/todo_item/todo_item_widget.dart';
import 'home_controller.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Todo List"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoController = HomeModule.to.bloc<HomeController>();

  _showTodoDialog({TodoModel todo}) {
    todo = todo ?? TodoModel();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("New todo"),
            content: TextField(
              maxLines: 5,
              onChanged: (value) {
                todo.title = value;
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Salvar"),
                onPressed: () {
                  todoController.add(todo);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: todoController.list.length,
            itemBuilder: (_, index) {
              TodoModel todo = todoController.list[index];
              return TodoItemWidget(todo: todo);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showTodoDialog();
        },
      ),
    );
  }
}
