import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _textFormField("Login", "Digite seu login", controller: _tLogin,
                validator: _validateLogin,
            ),
            SizedBox(
              height: 10,
            ),
            _textFormField("Senha", "Digite sua senha",
                password: true, controller: _tSenha, validator: _validatePassword,
            ),
            SizedBox(
              height: 20,
            ),
            _button("Login", _onClickLogin)
          ],
        ),
      ),
    );
  }

  //MÉTODOS WIDGETS

  _textFormField(String label, String hint,
      {bool password = false,
      controller,
      FormFieldValidator<String>? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
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

  /*
  Métodos de validação de formulários Login e Senha
   */
  String? _validateLogin(String? value) {
    if (value!.isEmpty) {
      return "Digite o login!";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Digite sua senha!";
    }
    return null;
  }

  /*
  Ação de Clique do botão Login
   */
  _onClickLogin() {
    bool formOk = _formKey.currentState!.validate();
    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha:$senha");
  }
}
