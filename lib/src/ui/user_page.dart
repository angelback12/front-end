import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/bloc/user_bloc.dart';
import 'package:licor/src/models/user_model.dart';
import 'package:licor/src/repository/repository.dart';
import 'package:licor/src/ui/user_select_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserPage> {
  TextEditingController nombreController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  UserBloc userBloc = new UserBloc();
  Repository repository = new Repository();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuarios"),
      ),
      body: Column(children: <Widget>[
        TextFormField(
          controller: nombreController,
          decoration: const InputDecoration(
            hintText: 'Ingrese su nombre',
            labelText: 'Nombre',
          ),
        ),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'Ingrese correo',
            labelText: 'Correo',
          ),
        ),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            hintText: 'Ingrese contraseña',
            labelText: 'contraseña',
          ),
        ),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            hintText: 'Ingrese su telegono',
            labelText: 'Telefono',
          ),
        ),
        new Container(
            child: new RaisedButton(
                child: const Text('Guardar'),
                onPressed: () async {
                  try {
                    UserModel userModel = new UserModel(
                        name: nombreController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: 50);
                    userBloc.insertUser(userModel);
                  } on FormatException catch (e) {
                    print(e);
                  }
                })),
      ]),
    );
  }
}
