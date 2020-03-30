import 'package:dnstestapi/Forms/Forms.dart';
import 'package:flutter/material.dart';
import 'package:dnstestapi/dns_api.dart';
import 'package:dnstestapi/model.dart';


class SendData extends StatefulWidget {

  @override
  _SendDataState createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonClicked = false;

  final githubController = TextEditingController();
  final resumeController = TextEditingController();

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,);

  @override
  void dispose() {
    githubController.dispose();
    resumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PersonalData personalData = ModalRoute.of(context).settings.arguments;

    void _submitFunction() async {
      if(_formKey.currentState.validate()) {
        setState(() {
          _isButtonClicked= !_isButtonClicked;
        });

      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Отправка данных',
          style: textStyle,
        ),
      ),
      body: Center(
        child: FutureBuilder<ApprovedData>(
          future: _isButtonClicked
                  ? sendDataAPI(PersonalData(
                                  name: personalData.name,
                                  surname: personalData.surname,
                                  email: personalData.email,
                                  phone: personalData.phone,
                                  token: personalData.token,
                                  github: githubController.text,
                                  resume: resumeController.text
                                  )
                                )
                  : null,
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.none:
                return Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      GithubForm(
                        githubController: githubController,
                      ),
                      ResumeForm(
                        resumeController: resumeController,
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        onPressed: _submitFunction,
                        child: Text(
                          'Зарегистрироваться',
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
              return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                if (snapshot.hasData) {
                  return Text('${snapshot.data.data}');
                }
            }
          },
        ),
      )
    );
  }
}
