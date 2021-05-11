import 'package:flutter/material.dart';

import 'package:task_friendly/services/authService.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthService _authService = AuthService();
  bool loginMode = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

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
                    width: size.width * 0.85,
                    height: loginMode ? size.height * 0.45 : size.height * 0.55,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.all(constraints.maxWidth * 0.05),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (loginMode)
                                  Text(
                                    'Welcome',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                if (loginMode)
                                  SizedBox(height: size.height * 0.02),
                                SizedBox(
                                  height: constraints.maxHeight * 0.15,
                                  child: TextField(
                                    controller: emailController,
                                    decoration: getInputDecortion().copyWith(
                                      hintText: "Email",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: constraints.maxHeight * 0.15,
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: getInputDecortion().copyWith(
                                      hintText: "Password",
                                    ),
                                  ),
                                ),
                                if (!loginMode)
                                  SizedBox(
                                    height: constraints.maxHeight * 0.15,
                                    child: TextField(
                                      controller: nameController,
                                      decoration: getInputDecortion().copyWith(
                                        hintText: "Name Lastname",
                                      ),
                                    ),
                                  ),
                                if (!loginMode)
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: ageController,
                                          decoration:
                                              getInputDecortion().copyWith(
                                            hintText: "Age",
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: TextField(
                                          controller: genderController,
                                          decoration:
                                              getInputDecortion().copyWith(
                                            hintText: "Gender",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                SizedBox(height: constraints.maxHeight * 0.05),
                                SizedBox(
                                  height: constraints.maxHeight * 0.11,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (loginMode) {
                                        await _authService.signIn(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                        );
                                      } else {
                                        if (nameController.text.isEmpty ||
                                            ageController.text.isEmpty ||
                                            genderController.text.isEmpty) {
                                          return;
                                        }
                                        await _authService.signUp(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text
                                                .split(" ")[0],
                                            lastname: nameController.text
                                                .split(" ")[1],
                                            age: ageController.text,
                                            gender: genderController.text);
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
                                SizedBox(height: constraints.maxHeight * 0.05),
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
