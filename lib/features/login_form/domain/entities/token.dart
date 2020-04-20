import 'package:equatable/equatable.dart';
class Token1 extends Equatable {
  final String data;
  final int code;
  final String message;

  Token1({this.data,this.code,this.message});

  @override
  List<Object> get props => [data, code, message];
}