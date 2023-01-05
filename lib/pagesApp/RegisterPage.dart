import 'package:flutter/material.dart';

import '../Database.dart/Queries.dart';
import 'Component.dart';
import 'HomePage.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

//import 'package:path_provider/path_provider.dart';
var UserNameconroller = TextEditingController();
var Emailconroller = TextEditingController();
var Mobileconroller = TextEditingController();
var Cityconroller = TextEditingController();
var Passwordconroller = TextEditingController();
var Stateconroller = TextEditingController();
var Genderconroller = TextEditingController();
var Ageconroller = TextEditingController();
var FormKey2 = GlobalKey<FormState>();
bool isPassword2 = true;
bool isTrueUserAlradyfound = true;

SqlDb sqldb = SqlDb();
List<Map>? responsee;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,

      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Register',
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
                    controller: UserNameconroller,
                    icon: Icons.child_care,
                    lable: 'User Name',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    isPassword: isPassword2,
                    suffix:
                        isPassword2 ? Icons.visibility_off : Icons.visibility,
                    suffixpress: () {
                      setState(() {
                        isPassword2 = !isPassword2;
                      });
                    },
                    controller: Passwordconroller,
                    icon: Icons.lock,
                    lable: 'Password',
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must be not empty';
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    controller: Mobileconroller,
                    icon: Icons.phone,
                    lable: 'Phone Number',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone Number must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    controller: Emailconroller,
                    icon: Icons.email_outlined,
                    lable: 'Email',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email must be not empty';
                      }
                      // else if (!value.contains("@")) {
                      //   return 'Must enter email please';
                      // }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    controller: Cityconroller,
                    icon: Icons.location_city,
                    lable: 'City',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'City must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    controller: Stateconroller,
                    icon: Icons.satellite,
                    lable: 'State',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'State must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    controller: Genderconroller,
                    icon: Icons.person_2_outlined,
                    lable: 'Gender',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Gender must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButtom(
                    controller: Ageconroller,
                    icon: Icons.view_agenda,
                    lable: 'Age',
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Age must be not empty';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: ButtonLogin(
                      height: 40,
                      color: Colors.blue,
                      function: () async {
                        if (FormKey2.currentState!.validate()) {
                          int responseTrain = await sqldb
                              .InsertDataFromDatabase(
                              "INSERT INTO Train VALUES ('cairo TO Alex','2008','mayer','12.00','5.00','200K')");
                          print(responseTrain);
                          //////////////////////////////////////////////////////////////////////////////////

                           responsee =
                          await sqldb.ReadDataFromDatabase(
                              "select * from 'Train' ");
                          print("$responsee");
                          print("////////////////////////////////////////////////////////////////////////////////////////");


                          List<Map> condition = await sqldb.ReadDataFromDatabase(
                              "select UserName ,Password from 'Customer' WHERE UserName = '${UserNameconroller
                                  .text}' AND Password = '${Passwordconroller
                                  .text}'  ");
                          print(condition);
                          if(condition.isEmpty) {
                            int response = await sqldb.InsertDataFromDatabase(
                                "INSERT INTO 'Customer' VALUES ('${UserNameconroller
                                    .text}','${Passwordconroller
                                    .text}',${Mobileconroller
                                    .text},'${Emailconroller
                                    .text}','${Cityconroller
                                    .text}','${Stateconroller
                                    .text}','${Genderconroller
                                    .text}',${Ageconroller.text})");
                            UserNamePage3 = UserNameconroller.text;
                            print(response);
                            print('User register success');

                            List<Map> responsee = await sqldb
                                .ReadDataFromDatabase(
                                "select * from 'Customer' ");
                            print("$responsee");
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  HomePage()),
                            );
                          }else{
                            print("User Name OR pass alrady exist");
                          }
                        };
                      },
                      text: 'Register Now',
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
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
