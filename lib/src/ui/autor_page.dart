import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/bloc/autor_bloc.dart';
import 'package:licor/src/models/autor_model.dart';
import 'package:licor/src/repository/repository.dart';
import 'package:licor/src/ui/user_select_page.dart';

class AutorPage extends StatefulWidget {
  const AutorPage({Key? key}) : super(key: key);
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  @override
  AutorFormState createState() {
    return AutorFormState();
  }
}

class AutorFormState extends State<AutorPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController nationController = new TextEditingController();
  TextEditingController numlibController = new TextEditingController();
  AutorBloc userBloc = new AutorBloc();
  Repository repository = new Repository();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Autores"),
      ),
      body: Column(children: <Widget>[
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Nombre del Autor',
            labelText: 'Autor',
          ),
        ),
        TextFormField(
          controller: nationController,
          decoration: const InputDecoration(
            hintText: 'Nacionalidad del Autor',
            labelText: 'Autor',
          ),
        ),
        TextFormField(
          controller: numlibController,
          decoration: const InputDecoration(
            hintText: 'Libros Escritos por el Autor',
            labelText: 'Numero de Libros',
          ),
        ),
        new Container(
            child: new RaisedButton(
                child: const Text('Guardar'),
                onPressed: () async {
                  try {
                    AutorModel autorModel = new AutorModel(
                        name: nameController.text,
                        nation: nationController.text,
                        numlib: 50);
                    userBloc.insertAutor(autorModel);
                  } on FormatException catch (e) {
                    print(e);
                  }
                })),
      ]),
    );
  }
}
