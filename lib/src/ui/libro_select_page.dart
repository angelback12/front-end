import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/bloc/libro_bloc.dart';
import 'package:licor/src/models/libro_model.dart';

class LibroSelect extends StatefulWidget {
  const LibroSelect({Key? key}) : super(key: key);

  @override
  LibroSelectScreen createState() {
    return LibroSelectScreen();
  }
}

class LibroSelectScreen extends State<LibroSelect> {
  LibroBloc libroBloc = new LibroBloc();
  late Future<List<LibroModel>> data;

  @override
  void initState() {
    super.initState();
    data = libroBloc.getLibro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Libro'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<LibroModel>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].description),
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
