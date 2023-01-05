import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Database.dart/Queries.dart';
import '../pagesApp/Component.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  bool istrue = false;
  bool istrue2 = false;
  var Oldnameconroller = TextEditingController();
  var newnameconroller = TextEditingController();
  var Mobileconroller = TextEditingController();
  var Passwordconroller = TextEditingController();
  var ConfirmPassworconroller = TextEditingController();
  var FormKey3 = GlobalKey<FormState>();
  var KeyFormData = GlobalKey<FormState>();
  bool isPassword2 = true;
  SqlDb sqldb = SqlDb();

  @override
  void initState() {
    print("initState Called");
    super.initState();
    // functionGetdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 1,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: Card(
                          color: Colors.blue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: $userNameUser ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Phone: $PhonenuberUser ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Age: $AgeUser ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Email:  $EmailUser',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ButtonLogin(
                          color: Colors.blue,
                          width: 200,
                          height: 40,
                          text: 'Edit Profile',
                          function: () {
                            setState(() {
                              istrue = true;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: istrue2
                            ? const Text(
                                'Update Profile successful !',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )
                            : Container(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: istrue ? FormEdit() : Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget FormEdit() => Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        //clipBehavior: Cl,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: FormKey3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextButtom(
                    controller: Oldnameconroller,
                    icon: Icons.person_2_outlined,
                    lable: 'old User Name',
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
                    controller: newnameconroller,
                    icon: Icons.person_2_outlined,
                    lable: 'New Name',
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
                    controller: Mobileconroller,
                    icon: Icons.phone,
                    lable: 'New Phone Number',
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
                    lable: 'New Password',
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
                    isPassword: isPassword2,
                    controller: ConfirmPassworconroller,
                    icon: Icons.lock,
                    lable: 'Confirm Password',
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm password must be not empty ';
                      }
                      if (value != Passwordconroller.text) {
                        return 'Confirm Password Not Match Password ';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Center(
                    child: ButtonLogin(
                      width: 200,
                      height: 40,
                      text: 'save change',
                      function: () async {
                        if (FormKey3.currentState!.validate()) {
                          List<Map> responsee = await sqldb.ReadDataFromDatabase(
                              "select UserName from 'Customer' WHERE UserName = '${Oldnameconroller.text}' ");
                          print('$responsee old name');
                          if (responsee.isNotEmpty) {
                            var res = await sqldb.UpDateDataFromDatabase(
                                "UPDATE Customer SET  = '${newnameconroller.text}', Password = '${Passwordconroller.text}',PhoneNumber = '${Mobileconroller.text}' WHERE UserName = '${Oldnameconroller.text}' ");
                            UserNamePage3 = newnameconroller.text;
                            print(" $res Update Profile success ");
                            setState(() {
                              istrue = false;
                              istrue2 = true;
                              functionGetdata();
                            });
                          }
                        }
                      },
                    ),
                  ),
                ],
              )),
        ),
      );
}
