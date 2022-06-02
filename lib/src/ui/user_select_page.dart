import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/bloc/user_bloc.dart';
import 'package:licor/src/models/user_model.dart';

class UserSelect extends StatefulWidget {
  const UserSelect({Key? key}) : super(key: key);

  @override
  UserSelectScreen createState() {
    return UserSelectScreen();
  }
}

class UserSelectScreen extends State<UserSelect> {
  UserBloc userBloc = new UserBloc();
  late Future<List<UserModel>> data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
        actions: [
          Chip(
            label: StreamBuilder<int>(builder: (context, snapshot) {
              return Text(
                (snapshot.data ?? 0).toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              );
            }),
            backgroundColor: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].email),
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
