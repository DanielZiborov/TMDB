import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login to your account',
        ),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            "In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. Click here to get started.",
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.buttonStyle,
            onPressed: () {},
            child: const Text('Register'),
          ),
          const SizedBox(height: 25),
          const Text(
            "If you signed up but didn't get your verification email.",
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.buttonStyle,
            onPressed: () {},
            child: const Text('Verify email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget();

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const color = Color(0xFF01B4E4);
    const borderStyle = OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
    );
    const fieldStyle = InputDecoration(
      enabledBorder: borderStyle,
      focusedBorder: borderStyle,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null)...[
          Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height:20),
        ],
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: fieldStyle,
        ),
        const SizedBox(height: 20),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: fieldStyle,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(color),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
                textStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
              onPressed: _auth,
              child: const Text('Login'),
            ),
            const SizedBox(width: 30),
            TextButton(
              style: AppButtonStyle.buttonStyle,
              onPressed: _resetPassword,
              child: const Text(
                'Reset password',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
