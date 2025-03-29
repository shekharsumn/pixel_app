import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/blocs/signin/signin_state.dart';
// Cubit
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult[0] == ConnectivityResult.none) {
      emit(SignInNoInternet());
      return;
    }

    try {
      // Simulate sign in process (replace with your actual logic)
      await Future.delayed(Duration(seconds: 2));
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
}