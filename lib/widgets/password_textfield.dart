import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const PasswordTextField(
      {super.key, required this.controller, required this.labelText});

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.amber), // Amber label text
        suffixIcon: IconButton(
          icon: Icon(
              _obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.amber), // Amber icon
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
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
      obscureText: _obscureText,
    );
  }
}

// Example usage:
// class MyScreen extends StatelessWidget {
//   final _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Password Input')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             PasswordTextField(controller: _passwordController, labelText: 'Password'),
//           ],
//         ),
//       ),
//     );
//   }
// }
