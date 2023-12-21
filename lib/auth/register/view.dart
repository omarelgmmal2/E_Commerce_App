import 'package:e_commerce_app/auth/login/view.dart';
import 'package:e_commerce_app/shared/design/app_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/design/app_button.dart';
import '../../shared/logic/helper_methods.dart';
import '../../view/home_page/view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  final phoneController = TextEditingController();
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
              height: 100,
            ),
            const Text(
              "Register",
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
              text: "UserName",
              controller: userController,
              validator: (value) {
                if(value!.isEmpty){
                  return "يجب ادخال اسم المستخدم";
                }else if(value.length>20){
                  return "يجب ان يكون اسم المستخدم اقل من 20 حرف ";
                }else{
                  return null;
                }
              },
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
            AppInput(
              text: "Phone Number",
              controller: phoneController,
              validator: (value) {
                if(value!.isEmpty){
                  return "يجب ادخال رقم هاتفك";
                }else if(value.length<11){
                  return "يجب ان يكون رقم هاتفك مكون من 11 رقم ";
                }else{
                  return null;
                }
              },
            ),
            AppButton(
              onPress: () async{
                debugPrint(emailController.text);
                debugPrint(passwordController.text);

                if (formKey.currentState!.validate())
                {
                  isLoading = true;
                  setState(() {

                  });
                  try {
                    UserCredential user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                    toGetNavigate(const HomePage(),);
                  } on FirebaseAuthException catch (ex) {
                    if (ex.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "No user found for that email.",
                          ),
                        ),
                      );
                    } else if (ex.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Wrong password provided for that user.",
                          ),
                        ),
                      );
                    }
                  } catch (ex) {
                    print(ex);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "There was an error",
                        ),
                      ),
                    );
                  }
                  isLoading = false;
                  setState(() {

                  });
                }
              },
              text:
              "Register",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "I Have Already An Account! ",
                ),
                GestureDetector(
                  onTap: () {
                    toGetNavigate(const LoginView(),);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffB77874),
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
