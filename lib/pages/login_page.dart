import 'package:app_carros/widgets/app_button.dart';
import 'package:app_carros/widgets/app_text.dart';
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
           AppText("Login", "Digite seu login",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha,),
            SizedBox(
              height: 10,
            ),
            AppText("Senha", "Digite sua senha",
                password: true,
                controller: _tSenha,
                validator: _validatePassword,
                keyboardType: TextInputType.number,
                focusNode: _focusSenha),
            SizedBox(
              height: 20,
            ),
            AppButton("Login", onPressed: _onClickLogin)
          ],
        ),
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
