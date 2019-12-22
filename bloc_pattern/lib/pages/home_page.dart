import 'package:bloc_pattern/bloc/home_bloc.dart';
import 'package:bloc_pattern/model/search_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBlock homeBloc = HomeBlock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchView(homeBloc: homeBloc),
            SearchResultView(homeBloc: homeBloc)
          ],
        ));
  }
}

class SearchView extends StatelessWidget {
  final HomeBlock homeBloc;

  SearchView({this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        child: TextField(
            decoration: InputDecoration(
                hintText: "CEP",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                )),
            onChanged: (word) => homeBloc.input.add(word)));
  }
}

class SearchResultView extends StatelessWidget {
  final HomeBlock homeBloc;
  SearchResultView({this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Center(
        child: StreamBuilder<SearchResponse>(
            stream: homeBloc.output,
            initialData: null,
            builder: (context, snapshot) {
              
              if (snapshot.hasError || snapshot.data == null) {
                return Text("CEP não encontrado");
              }
              
              var searchResponse = snapshot.data;

              if (searchResponse.bairro == null) {
                return Text(
                "CEP não encontrado"
                );
              }
              return Text(
                "Enrereço: ${searchResponse.bairro}, ${searchResponse.localidade} - ${searchResponse.uf} "
              );

            }),
      ),
    );
  }
}
