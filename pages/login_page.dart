import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _textFormField(),
          SizedBox(
            height: 10,
          ),
          _textFormFieldSenha(),
          SizedBox(
            height: 20,
          ),
          _container()
        ],
      ),
    );
  }

  //MÉTODOS WIDGETS

  Container _container() {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: () {},
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  TextFormField _textFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.blue, fontSize: 20),
      decoration: InputDecoration(
          labelText: "Login",
          labelStyle: TextStyle(color: Colors.grey, fontSize: 25),
          hintText: "Digite o seu login"),
    );
  }
}

TextFormField _textFormFieldSenha() {
  return TextFormField(
    style: TextStyle(color: Colors.blue, fontSize: 20),
    obscureText: true,
    decoration: InputDecoration(
        labelText: "Senha",
        labelStyle: TextStyle(color: Colors.grey, fontSize: 25),
        hintText: "Digite a sua senha"),
  );
}
