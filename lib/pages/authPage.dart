import 'package:flutter/material.dart';

import 'package:task_friendly/services/authService.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthService _authService = AuthService();
  bool loginMode = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void setIsLogginMode({isLoggin}) {
    setState(() {
      loginMode = isLoggin;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: size.width, minHeight: size.height),
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipper: RoundedContainer(),
                child: Container(
                  width: size.width,
                  height: size.height / 2.5,
                  color: Colors.teal,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'TaskFriendly',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: Image.asset(
                            "assets/icons/appLogo.png",
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: RoundedContainerBottom(),
                child: Container(
                  width: size.width,
                  height: size.height / 5,
                  color: Colors.teal,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    width: 350,
                    height: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Welcome',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 50,
                                child: TextField(
                                  controller: email,
                                  decoration: getInputDecortion().copyWith(
                                    hintText: "Email",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                child: TextField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: getInputDecortion().copyWith(
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                              if (!loginMode) SizedBox(height: 10),
                              if (!loginMode)
                                SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: confirmPassword,
                                    obscureText: true,
                                    decoration: getInputDecortion().copyWith(
                                      hintText: "Confirm Password",
                                    ),
                                  ),
                                ),
                              SizedBox(height: 15),
                              SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (loginMode) {
                                      await _authService.signIn(
                                        email.text.trim(),
                                        password.text.trim(),
                                      );
                                    } else {
                                      if (confirmPassword.text.isEmpty ||
                                          confirmPassword.text !=
                                              password.text) {
                                        return;
                                      }
                                      await _authService.signUp(
                                        email.text.trim(),
                                        password.text.trim(),
                                      );
                                    }
                                  },
                                  child: Text(loginMode ? 'Login' : 'Signup'),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50),
                              GestureDetector(
                                onTap: () =>
                                    setIsLogginMode(isLoggin: !loginMode),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Or ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    children: [
                                      TextSpan(
                                        text: loginMode ? 'Signup' : 'Login',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.red[700],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration getInputDecortion() {
  return InputDecoration(
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: EdgeInsets.only(top: 50 / 2, left: 10),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class RoundedContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double fromTop = 50.0;
    path.lineTo(0, size.height - fromTop);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - fromTop);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RoundedContainerBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double fromTop = 50.0;
    path.quadraticBezierTo(size.width / 2, fromTop, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
