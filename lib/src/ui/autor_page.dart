import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/bloc/autor_bloc.dart';
import 'package:licor/src/models/autor_model.dart';
import 'package:licor/src/repository/repository.dart';
import 'package:licor/src/ui/autor_select_page.dart';

import 'menu_page.dart';

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
  AutorBloc autorBloc = new AutorBloc();
  Repository repository = new Repository();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Autores"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Autor',
                    hintText: 'Nombre del Autor'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nationController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nacionalidad',
                    hintText: 'Nacionalidad del Autor'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: numlibController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Libros Escritos',
                    hintText: 'Numero de Libros Escritos'),
              ),
            ),
            FlatButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                '',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  try {
                    AutorModel autorModel = new AutorModel(
                        name: nameController.text,
                        nation: nationController.text,
                        numlib: int.parse(numlibController.text));
                    autorBloc.insertAutor(autorModel);
                  } on FormatException catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'Guardar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
