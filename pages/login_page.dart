import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

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
          _textFormField("Login", "Digite seu login", controller: _tLogin),
          SizedBox(
            height: 10,
          ),
          _textFormField("Senha", "Digite sua senha", password: true, controller: _tSenha),
          SizedBox(
            height: 20,
          ),
          _button("Login", _onClickLogin)
        ],
      ),
    );
  }

  //MÉTODOS WIDGETS

   _textFormField(String label, String hint, {bool password = false, controller}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      style: TextStyle(color: Colors.blue, fontSize: 20),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 25),
          hintText: hint),
    );
  }

 _button(String text, onPressed) {
  return Container(
    height: 46,
    child: RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      onPressed: onPressed,
    ),
  );
}

  _onClickLogin() {
    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha:$senha");
  }
}



