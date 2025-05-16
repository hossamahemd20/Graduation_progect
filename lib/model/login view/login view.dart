import 'package:flutter/material.dart';

import '../../Api/login_api.dart';
import '../../core/page_route_names.dart';
import '../home/home_view.dart';

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Center(
                    child: Hero(
                      tag: 'logo',
                      child: Image(
                        image: AssetImage("assets/images/sgslogo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        label: const Text(" Name"),
                        hintText: "Enter your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return " please Enter name";
                      }
                      return null;
                    }),
                SizedBox(height: 30),
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
                SizedBox(height: 30),
                TextFormField(
                    onFieldSubmitted: (value) {},
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
                            child: Icon(isObscure
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true),
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return " please Enter Password";
                      }
                      return null;
                    }),
                const SizedBox(height: 40),
                Center(
                  child: FilledButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        // استدعاء دالة تسجيل الدخول
                        String? loginResult = await AuthService.loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (loginResult == null) {
                          // التوكن تم تخزينه بنجاح

                          // التنقل إلى الشاشة الرئيسية
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(),
                            ),
                          );
                        } else {
                          // فشل عملية تسجيل الدخول
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login failed: $loginResult")),
                          );
                        }
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
                      "Forgot Password?",
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
                      " Create New Account ! ",
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
