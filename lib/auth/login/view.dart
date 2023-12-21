import 'package:e_commerce_app/auth/register/view.dart';
import 'package:e_commerce_app/shared/design/app_button.dart';
import 'package:e_commerce_app/shared/design/app_input.dart';
import 'package:e_commerce_app/shared/logic/helper_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../view/home_page/view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            AppInput(
              text: "Email",
              controller: emailController,
              onChange: (p0) {
                email = p0;
                setState(() {

                });
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "يجب ادخال بريدك الالكتروني";
                }else if(value.length<15){
                  return "يجب ان يكون بريدك الالكتروني اكبر من 20 حرف ";
                }else{
                  return null;
                }
              },
            ),
            AppInput(
              text: "Password",
              controller: passwordController,
              onChange: (p0) {
                password = p0;
                setState(() {

                });
              },
              isPassword: true,
              validator: (value) {
                if(value!.isEmpty){
                  return "يجب ادخال كلمه المرور";
                }else if(value.length<8){
                  return "يجب ان تكون كلمه المرور اكبر من 8 ارقام ";
                }else{
                  return null;
                }
              },
            ),
            AppButton(
                onPress: ()async{
                  debugPrint(emailController.text);
                  debugPrint(passwordController.text);

                  if(formKey.currentState!.validate())
                  {
                    isLoading = true;
                    setState(() {

                    });
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      toGetNavigate(const HomePage(),);
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "email already exists",
                            ),
                          ),
                        );
                      }else if (ex.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "weak password",
                            ),
                          ),
                        );
                      }
                    } catch (ex) {
                      print(ex);
                    }
                    isLoading = false;
                    setState(() {

                    });
                  }
                },
                text:
                  "Login",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                    "I Have Not Account! ",
                ),
                GestureDetector(
                  onTap: () {
                    toGetNavigate(const RegisterView(),);
                  },
                  child: const Text(
                      "Register",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}