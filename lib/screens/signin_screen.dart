import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/blocs/signin/signin_cubit.dart';
import 'package:one_cask/blocs/signin/signin_state.dart';
import 'package:one_cask/widgets/password_textfield.dart';

class SignInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontFamily: 'EB Garamond',
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    var textStyle16 = TextStyle(
      fontFamily: 'EB Garamond',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFF0B1519),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0B1519),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                  'Sign in successful!',
                  style: textStyle16,
                )),
              );
              Navigator.pushNamed(context, '/home'); // Change route as needed
            } else if (state is SignInFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                  'Sign in failed: ${state.error}',
                  style: textStyle16,
                )),
              );
            } else if (state is SignInNoInternet) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                  'No internet connection. Please try again later.',
                  style: textStyle16,
                )),
              );
            }
          },
          builder: (context, state) {
            if (state is SignInLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in',
                        style: textStyle,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Colors.amber), // Amber label text
                      enabledBorder: UnderlineInputBorder(
                        // Amber underline when not focused
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        // Amber underline when focused
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ), // Amber input text
                  ),
                  PasswordTextField(
                      controller: _passwordController, labelText: 'Password'),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        context.read<SignInCubit>().signIn(
                              _emailController.text,
                              _passwordController.text,
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      child: Text('Continue')),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Can't sign in?",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to recover password screen
                        },
                        child: Text('Recover password'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
