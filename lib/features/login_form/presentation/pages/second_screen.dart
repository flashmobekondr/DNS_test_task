import 'package:dnstestapi/features/login_form/presentation/bloc/second_page_login_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/second_page_login_bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/widgets/Forms.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SecondPageBloc _secondPageBloc;
  final TextEditingController githubController = TextEditingController();
  final TextEditingController resumeController = TextEditingController();

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,);

  @override
  void initState() {
    super.initState();
    _secondPageBloc = BlocProvider.of<SecondPageBloc>(context);
    githubController.addListener(_onGithubChanged);
    resumeController.addListener(_onResumeChanged);
  }

  @override
  void dispose() {
    githubController.dispose();
    resumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SecondPageBloc, ValidateStateSecond>(
      listener: (context, state) {
        if (state is ErrorStateSecond) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Ошибка отправки данных'),
            backgroundColor: Colors.red,
          ));
        }
        if (state is DataSentState) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Данные успешно отправлены'),
            backgroundColor: Colors.red,
          ));
        }
    },
      child: BlocBuilder<SecondPageBloc, ValidateStateSecond>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Отправка данных',
                style: textStyle,
              ),
            ),
            body: Form(
              child: Column(
                children: <Widget>[
                  GithubForm(
                    githubController: githubController,
                    isGithubValid: state.isGithubValid,
                  ),
                  ResumeForm(
                    resumeController: resumeController,
                    isResumeValid: state.isResumeValid,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      color: Colors.orange,
                      onPressed: state.isFormValid ?_onSubmitted : null,
                      child: Text(
                        'Зарегистрироваться',
                        style: textStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onGithubChanged() {
    _secondPageBloc.add(GithubChanged(github: githubController.text));
  }

  void _onResumeChanged() {
    _secondPageBloc.add(ResumeChanged(resume: resumeController.text));
  }

  void _onSubmitted() {
    _secondPageBloc.add(FormSubmittedSecond());
  }
}
