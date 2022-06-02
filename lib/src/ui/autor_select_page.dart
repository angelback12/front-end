import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/bloc/autor_bloc.dart';
import 'package:licor/src/models/autor_model.dart';

class AutorSelect extends StatefulWidget {
  const AutorSelect({Key? key}) : super(key: key);

  @override
  AutorSelectScreen createState() {
    return AutorSelectScreen();
  }
}

class AutorSelectScreen extends State<AutorSelect> {
  AutorBloc libroBloc = new AutorBloc();
  late Future<List<AutorModel>> data;

  @override
  void initState() {
    super.initState();
    data = libroBloc.getAutor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Autores'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<AutorModel>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].nation),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
