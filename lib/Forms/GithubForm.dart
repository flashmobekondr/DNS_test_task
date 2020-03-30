import 'package:flutter/material.dart';

class GithubForm extends StatelessWidget {
  final TextEditingController githubController;
  GithubForm({this.githubController});
  final RegExp _urlRegExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}'
      r'\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)'
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.url,
      controller: githubController,
      validator: validateFunction,
      textInputAction: TextInputAction.next,
      onFieldSubmitted:(_){
        FocusScope.of(context).nextFocus();
      },
      decoration: InputDecoration(
        hintText: 'Ссылка на github',
        suffix: GestureDetector(
          child: Icon(
            Icons.clear,
            color: Colors.grey,
          ),
          onTap: () => githubController.clear(),
        ),
      ),
    );
  }
  String validateFunction(String value) {
    if (value.isNotEmpty) {
      if (_urlRegExp.hasMatch(githubController.text)) {
        return null;
      }
      return 'Некорректные данные';
    }
    return 'Введите данные';
  }
}
