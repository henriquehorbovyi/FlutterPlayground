import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as prathProvider;
import 'todo_model.dart';

class LocalStorageService extends Disposable {
  Completer<Box> completer = Completer<Box>();

  LocalStorageService() {
    _initStorage();
  }

  _initStorage() async {
    final docsDirectory =
        await prathProvider.getApplicationDocumentsDirectory();
    Hive.init(docsDirectory.path);
    final box = await Hive.openBox("todo");
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<List<TodoModel>> getAll() async {
    final box = await completer.future;
    return box.values.map((item) => TodoModel.fromJson(item)).toList();
  }

  Future<TodoModel> save(TodoModel todo) async {
    final box = await completer.future;
    todo.id = box.values.length;
    await box.put(todo.id, todo.toString());
    return todo;
  }

  update(TodoModel todo) async {
    final box = await completer.future;
    await box.put(todo.id, todo.toString());
  }

  remove(int id) async {
    final box = await completer.future;
    await box.delete(id);
  }

  @override
  void dispose() async {
    final box = await completer.future;
    box.close();
  }
}
