import 'package:mobx/mobx.dart';

import '../../shared/local_storage_service.dart';
import '../../shared/todo_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final LocalStorageService service;

  _HomeBase({this.service}) {
    _init();
  }

  @observable
  ObservableList<TodoModel> list = ObservableList<TodoModel>();

  _init() async {
    final allList = await service.getAll();
    list.addAll(allList);
  }

  @action
  add(TodoModel todo) async {
    todo = await service.save(todo);
    list.add(todo);
  }
}
