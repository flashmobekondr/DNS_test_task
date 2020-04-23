import 'package:dnstestapi/core/network/network_info.dart';
import 'package:dnstestapi/features/login_form/data/model/login_form_token_model.dart';
import 'package:dnstestapi/features/login_form/domain/entities/token.dart';
import 'package:dnstestapi/features/login_form/domain/repositories/login_form_repository.dart';
import 'package:dnstestapi/features/login_form/data/datasources/login_form_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginFormRepositoryImpl implements LoginFormRepository {
  final SharedPreferences sharedPreferences;
  final LoginFormRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginFormRepositoryImpl({
    this.remoteDataSource,
    this.networkInfo,
    this.sharedPreferences
  });

  @override
  Future<Token1> getToken(
      String name,
      String surname,
      String email,
      String phone) async {
        return await _getData(() {
          return remoteDataSource.getToken(name, surname, email, phone);
    });
  }

  @override
  Future<TokenModel> sendPersonal(
      String github,
      String resume) async {
        return await _getData(() {
          return remoteDataSource.sendPersonal(github, resume);
        });
  }

  Future<TokenModel>_getData(
      Future<TokenModel> Function() getTokenOrPersonal) async{
    if (await networkInfo.isConnected) {
      try {
        final result = await getTokenOrPersonal();
        return result;
      }
      catch(e) {
        throw Exception('error fetching data');
      }
    } else {
      throw Exception('error no connection');
    }
  }

  @override
  bool hasToken() {
    sharedPreferences.clear();
    return sharedPreferences.containsKey('CACHED_TOKEN');
  }

}