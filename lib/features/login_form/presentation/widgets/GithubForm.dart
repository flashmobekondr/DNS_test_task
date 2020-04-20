import 'package:flutter/material.dart';

class GithubForm extends StatelessWidget {
  final bool isGithubValid;
  final TextEditingController githubController;
  GithubForm({this.githubController,this.isGithubValid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.url,
      controller: githubController,
      autovalidate: true,
      validator: (_) {
        return isGithubValid ? null : 'Неправильная ссылка';
      },
      textInputAction: TextInputAction.next,
      onFieldSubmitted:(_){
        FocusScope.of(context).nextFocus();
      },
      decoration: InputDecoration(
        hintText: 'Ссылка на github',
      ),
    );
  }
}
