import 'user_bloc.dart';

class UserBlocController {
  UserBlocController._();
  static final _instance = UserBlocController._();
  factory UserBlocController() => _instance;
  // ignore: close_sinks
  UserBloc userBloc = UserBloc();
}
