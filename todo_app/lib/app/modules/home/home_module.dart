import 'package:todo_app/app/app_module.dart';
import 'package:todo_app/app/modules/home/home_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/modules/home/home_page.dart';
import 'package:todo_app/app/shared/local_storage_service.dart';

class HomeModule extends ModuleWidget {
  final localStorageService = AppModule.to.get<LocalStorageService>();

  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeController(
              service: LocalStorageService(),
            ))
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
