import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dnstestapi/features/login_form/interactions/interactor/login_form_interactor.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dnstestapi/core/network/network_info.dart';
import 'package:dnstestapi/features/login_form/data/datasources/login_form_remote_data_source.dart';
import 'package:dnstestapi/features/login_form/data/repositories/login_form_repository_impl.dart';
import 'package:dnstestapi/features/login_form/domain/repositories/login_form_repository.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/get_token.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/send_personal.dart';
import 'package:dnstestapi/features/login_form/domain/usecases/validate_data.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/first_page_login_bloc/bloc.dart';
import 'package:dnstestapi/features/login_form/presentation/bloc/second_page_login_bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init () async {
  //Bloc
 sl.registerFactory(
         () => FirstPageBloc(
           validate: sl(),
           getToken: sl(),
           sharedPreferences: sl()
         )
 );
 sl.registerFactory(
         () => SecondPageBloc(
           validate: sl(),
           sendPersonal: sl(),
           sharedPreferences: sl()
         )
 );

  //Use cases
  sl.registerLazySingleton(() => GetToken(repository: sl()));
  sl.registerLazySingleton(() => SendPersonal(repository: sl()));
  sl.registerLazySingleton(() => Validate(interactor: sl()));

  //Repository
  sl.registerLazySingleton<LoginFormRepository>(
          () => LoginFormRepositoryImpl(
            remoteDataSource: sl(),
            networkInfo: sl(),
          )
  );

  //Data sources
  sl.registerLazySingleton<LoginFormRemoteDataSource>(
          () => LoginFormRemoteDataSourceImpl(
            client: sl(),
            sharedPreferences: sl(),
          )
  );

  //Core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(
            connectionChecker: sl()
          )
  );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => LoginFormInteractor());
}