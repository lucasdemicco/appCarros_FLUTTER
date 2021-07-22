import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
            _textFormField("Login", "Digite seu login",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha),
            SizedBox(
              height: 10,
            ),
            _textFormField("Senha", "Digite sua senha",
                password: true,
                controller: _tSenha,
                validator: _validatePassword,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha
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

  _textFormField(String label, String hint,
      {bool password = false,
      controller,
      FormFieldValidator<String>? validator,
      TextInputType? keyboardType,
      TextInputAction? textInputAction,
      FocusNode? focusNode,
      FocusNode? nextFocus}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
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
    if (value.length < 6) {
      return "A senha precisa ter no mínimo 6 caracteres";
    }
    return null;
  }

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
