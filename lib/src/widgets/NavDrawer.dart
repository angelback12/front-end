import 'package:flutter/material.dart';
import '../ui/acerca_page.dart';
import '../ui/libro_page.dart';
import '../ui/libro_select_page.dart';
import '../ui/user_select_page.dart';
import '../ui/user_page.dart';
import '../ui/autor_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Biblioteca APP',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 95, 196, 255),
            ),
          ),
          /** ListTile(
            leading: Icon(Icons.create),
            title: Text('Usuarios'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UserPage()))
            },
          ), */
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Libro'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LibroPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Libro Disponible'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LibroSelect()))
            },
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Autores'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AutorPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Listado de Autores'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LibroSelect()))
            },
          ),
          ListTile(
            leading: Icon(Icons.view_column),
            title: Text('Acerca de Bibilioteca'),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => acercaPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesiíon'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
