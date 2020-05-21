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
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Отправка данных',
          style: textStyle,
        ),
      ),
      body: BlocListener<SecondPageBloc, SecondStatePage>(
        listener: (context, state) {
          if (state is ValidateStateSecond) {
            state.isError ?
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Error fetching data'),
                backgroundColor: Colors.red,
              ),
            )
                : Container();
          }
        },
        child: BlocBuilder<SecondPageBloc,SecondStatePage>(
          builder: (context, state) {
            if (state is LoadingStateSecond) {
              return Scaffold(
                body: Center(
                    child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ValidateStateSecond) {
              return Form(
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
                    ),
                  ],
                ),
              );
            }
            return Scaffold(
              body: Center(child: Text('SUCCESS'),),
            );
          },
        ),
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
