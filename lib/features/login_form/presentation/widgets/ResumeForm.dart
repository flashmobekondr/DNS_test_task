import 'package:flutter/material.dart';

class ResumeForm extends StatelessWidget {
  final bool isResumeValid;
  final TextEditingController resumeController;
  ResumeForm({this.resumeController,this.isResumeValid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.url,
      controller: resumeController,
      autovalidate: true,
      validator: (_) {
        return isResumeValid ? null : 'Неправильная ссылка';
      },
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_){
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Ссылка на резюмэ',
      ),
    );
  }
}
