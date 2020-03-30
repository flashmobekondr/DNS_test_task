import 'package:flutter/material.dart';
import 'package:dnstestapi/dns_api.dart';
import 'package:dnstestapi/Forms/Forms.dart';
import 'package:dnstestapi/model.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,);

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Ввод данных',
          style: textStyle,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            NameForm(
              nameController: nameController,
            ),
            SurnameForm(
              surnameController: surnameController,
            ),
            EmailForm(
              emailController: emailController,
            ),
            PhoneForm(
              phoneController: phoneController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                color: Colors.orange,
                onPressed: submitFunction,
                child: Text(
                  'Получить ключ',
                  style: textStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void submitFunction() async {
    if (_formKey.currentState.validate()) {
        try {
          final data = await requestTokenAPI(PersonalData(
                                              name: nameController.text,
                                              surname: surnameController.text,
                                              phone: phoneController.text,
                                              email: emailController.text,
                                              )
                                            );

          Navigator
              .of(context)
              .pushNamed(
                  '/sendForm',
                  arguments: PersonalData(
                    name: nameController.text,
                    surname: surnameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    token: data.token
                  )
          );
        }
        catch(error) {
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                  content: Text('$error'),
                  backgroundColor: Colors.red,
              )
          );
        }
    }
  }
}

