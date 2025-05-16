import 'package:flutter/material.dart';

import '../../core/page_route_names.dart';


class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool isObscure = true;
  var formkey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
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
                const Image(image: AssetImage("assets/images/sgs logo.png"),
                ),
                const SizedBox(height: 100,),
                TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        label: const Text(" Name"),
                        hintText: "Enter your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),

                        filled: true
                    ),
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return " please Enter name";
                      }
                      return null;
                    }),
                SizedBox(height: 30,),
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
                  validator: (value){
                    if(value ==null||value.trim().isEmpty)
                    {
                      return " please Enter e-mail";
                    }
                    var regex=RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
                    );
                    if(!regex.hasMatch(value)){
                      return "invalid Email";
                    }
                    return null;

                  },
                ),
                SizedBox(height: 30,),
                TextFormField(

                    controller: passwordController,
                    decoration: InputDecoration(
                        label: const Text(" Password"),
                        hintText: "Enter your Password",
                        suffixIcon: InkWell(
                            onTap: ()
                            {
                              setState(() {
                                isObscure=! isObscure;
                              });


                            },
                            child:  Icon(
                                isObscure?
                                Icons.visibility: Icons.visibility_off)),


                        border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20),


                        ),
                        filled: true

                    ),
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return " please Enter Password";
                      }
                      return null;


                    }),
                const SizedBox(height: 40,),
                TextFormField(

                    controller: passwordController,
                    decoration: InputDecoration(
                        label: const Text(" confirm  Password"),
                        hintText: "confirm your Password",
                        suffixIcon: InkWell(
                            onTap: ()
                            {
                              setState(() {
                                isObscure=! isObscure;
                              });
                            },
                            child:  Icon(
                                isObscure?
                                Icons.visibility: Icons.visibility_off)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true

                    ),
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return " please Enter Password";
                      }
                      return null;
                    }),
                const SizedBox(height: 40,),
                Center(
                  child: FilledButton(onPressed: (){

                    if(formkey.currentState!.validate())
                    {
                      print("availed");
                    }
                  },
                      child:
                      InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, PageRouteNames.Login);
                          },
                          child: const Text("Sign Up "))
                  ),

                ),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),// Background color
    );
  }
}
