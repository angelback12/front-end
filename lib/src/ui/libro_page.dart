import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/bloc/libro_bloc.dart';
import 'package:licor/src/models/libro_model.dart';
import 'package:licor/src/repository/repository.dart';
import 'package:licor/src/ui/user_select_page.dart';

import 'menu_page.dart';

class LibroPage extends StatefulWidget {
  const LibroPage({Key? key}) : super(key: key);
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<LibroPage> {
  TextEditingController nombreController = new TextEditingController();
  TextEditingController descripcionController = new TextEditingController();

  LibroBloc libroBloc = new LibroBloc();
  Repository repository = new Repository();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Libros"),
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
                controller: nombreController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Titulo',
                    hintText: 'Titulo Libro'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: descripcionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripcion',
                    hintText: 'Descripcion del libro'),
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
                    LibroModel libroModel = new LibroModel(
                        name: nombreController.text,
                        description: descripcionController.text);
                    libroBloc.insertLibro(libroModel);
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
