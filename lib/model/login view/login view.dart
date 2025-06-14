import 'package:flutter/material.dart';
import 'package:graduation_project/core/page_route_names.dart';
import 'package:graduation_project/model/home/home_view.dart';
// import '../../Api/login_api.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscure = true;
  var formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8292BB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage("assets/images/logo2.png"),
                ),
                const SizedBox(height: 100),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: const Text(" Name"),
                    hintText: "Enter your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return " please Enter name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: const Text("E-mail"),
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return " please Enter e-mail";
                    }
                    var regex = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                    if (!regex.hasMatch(value)) {
                      return "invalid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  onFieldSubmitted: (value) {
                    // userModel().password = value;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    label: const Text(" Password"),
                    hintText: "Enter your Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                  ),
                  obscureText: isObscure,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return " please Enter Password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: FilledButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        // لو عايز تضيف API Login شغّل ده:
                        // String? loginResult = await AuthService.loginUser(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // );
                        // if (loginResult == null) {

                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 800),
                            pageBuilder: (_, __, ___) =>  HomeScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              final offsetAnimation = Tween<Offset>(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ));

                              final fadeAnimation = Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeIn,
                              ));

                              return SlideTransition(
                                position: offsetAnimation,
                                child: FadeTransition(
                                  opacity: fadeAnimation,
                                  child: child,
                                ),
                              );
                            },
                          ),
                        );

                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("Login failed: $loginResult")),
                        //   );
                        // }
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, PageRouteNames.forgetpassword);
                    },
                    child: const Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, PageRouteNames.regisration);
                    },
                    child: const Text(
                      " ",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 22,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
