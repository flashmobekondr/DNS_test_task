import 'package:dnstestapi/features/login_form/presentation/bloc/first_page_login_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/second_page_login_bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/widgets/Forms.dart';
import 'package:dnstestapi/features/login_form/presentation/pages/second_screen.dart';
import 'package:dnstestapi/injection_container.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirstPageBloc _firstPageBloc;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,);

  @override
  void initState() {
    super.initState();
    _firstPageBloc = BlocProvider.of<FirstPageBloc>(context);
    nameController.addListener(_onNameChanged);
    surnameController.addListener(_onSurnameChanged);
    emailController.addListener(_onEmailChanged);
    phoneController.addListener(_onPhoneChanged);

  }

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
    return BlocListener<FirstPageBloc, FirstValidateState>(
      listener: (context, state) {
        if (state is MoveToNextScreenState) {
          Navigator
              .of(context)
              .push(MaterialPageRoute(
              builder: (context) {
                return BlocProvider<SecondPageBloc>(
                  create: (context) =>sl<SecondPageBloc>(),
                  child: SecondPage(),
                );
              }
          ));
        }
        if (state is ErrorStateFirst) {
          Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Error fetching data'),
                backgroundColor: Colors.red,
              )
          );
        }
      },
      child: BlocBuilder<FirstPageBloc,FirstValidateState>(
        builder: (context, state) {
          if (state is LoadingStateFirst) {
            return CircularProgressIndicator();
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Ввод данных',
                style: textStyle,
              ),
            ),
            body: Form(
              child: Column(
                children: <Widget>[
                  NameForm(
                    nameController: nameController,
                    isNameValid: state.isNameValid
                  ),
                  SurnameForm(
                    surnameController: surnameController,
                    isSurnameValid: state.isSurnameValid
                  ),
                  EmailForm(
                    emailController: emailController,
                    isEmailValid: state.isEmailValid
                  ),
                  PhoneForm(
                    phoneController: phoneController,
                    isPhoneValid: state.isPhoneValid
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      color: Colors.orange,
                      onPressed: state.isFormValid ?_onSubmitted : null,
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
        },
      ),
    );
  }

  void _onNameChanged() {
    _firstPageBloc.add(NameChanged(name: nameController.text));
  }

  void _onSurnameChanged() {
    _firstPageBloc.add(SurnameChanged(surname: surnameController.text));
  }

  void _onEmailChanged() {
    _firstPageBloc.add(EmailChanged(email: emailController.text));
  }

  void _onPhoneChanged() {
    _firstPageBloc.add(PhoneChanged(phone: phoneController.text));
  }
  void _onSubmitted() {
    _firstPageBloc.add(FormSubmittedFirst());
  }
}

