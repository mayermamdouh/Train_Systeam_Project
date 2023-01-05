import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../Database.dart/Queries.dart';
import 'Component.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

GlobalKey<FormState> _homeKey =
    GlobalKey<FormState>(debugLabel: '_homeScreenkey');
var UserNmaecontroller = TextEditingController();
var passwordcontroller = TextEditingController();
var FormKey = GlobalKey<FormState>();
bool isPassword = true;

SqlDb sqldb = SqlDb();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage('https://www.progressiverailroading.com/resources/editorial/2022/101521PR0721-HighSpeedTrain.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextButtom(
                    controller: UserNmaecontroller,
                    icon: Icons.email,
                    lable: 'User Name',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'User Name must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    isPassword: isPassword,
                    suffix:
                        isPassword ? Icons.visibility_off : Icons.visibility,
                    suffixpress: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    controller: passwordcontroller,
                    icon: Icons.lock,
                    lable: 'Password',
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  ButtonLogin(
                      width: double.infinity,
                      text: 'login',
                      color: Colors.blue,
                      height: 40,
                      isUpperCase: true,
                      function: () async {
                        if (FormKey.currentState!.validate()) {
                          List<Map> responsee = await sqldb.ReadDataFromDatabase(
                              "select UserName ,Password from 'Customer' WHERE UserName = '${UserNmaecontroller.text}' AND Password = '${passwordcontroller.text}'  ");
                          print(responsee);
                          if (responsee.isNotEmpty) {
                            print("user in Database");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else if (responsee != UserNmaecontroller.text) {
                            print(responsee);
                            print("user not found in Database");
                          }
                        }
                        ;
                      }),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an Account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: Text('Register Now',style: TextStyle(color: Colors.blue),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
