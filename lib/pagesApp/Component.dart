import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database.dart/Queries.dart';

// Data Ticket
// ignore: non_constant_identifier_names
int index = 0;
String? Name;
String? SeatNO;
String? CartNO;
String? DateTim;
String? Class;
String? Fare;
String? Destination;
bool isTrue9 = false;
bool isTrueDeleate = false;
bool isTrueDeleatenotfound = false;
bool isTrue = true;
bool isTrue5 =  true;
SqlDb sqldb = SqlDb();
bool isSeatincomplete = false;



//Save user name user from Register page
String? UserNamePage3;

//getDatauser
String? userNameUser;
String? PhonenuberUser;
String? AgeUser;
String? EmailUser;

functionGetdata() async {
  List<Map> responsee = await sqldb.ReadDataFromDatabase(
      "select * from 'Customer' WHERE UserName = '$UserNamePage3' ");
  print('${responsee}');
  userNameUser = "${responsee[0]['UserName']}";
  PhonenuberUser = "${responsee[0]['PhoneNumber']}" as String;
  AgeUser = "${responsee[0]['Age']}" as String;
  EmailUser = "${responsee[0]['CustomerEmail']}";
}

Widget ButtonLogin({
  double? width,
  Color? color = Colors.blue,
  bool isUpperCase = true,
  double? height,
  double? fontSize = 15.0,
  void Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text.toLowerCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget TextButtom({
  required TextEditingController controller,
  TextInputType? type,
  required String lable,
  double? width,
  double? height,
  IconData? icon,
  required String? Function(String?)? validator,
  IconData? suffix,
  bool isPassword = false,
  void Function()? suffixpress,
  bool? condition,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: (value) {
        print(value);
      },

      validator: validator,
      obscureText: isPassword,
      keyboardType: type, //  no3 alhktbo gawa ya3ne number aw text....
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(
          icon,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpress,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

class TicketController extends GetxController {
  var indexWagon = 0.obs;

  void reset() {
    Wagon.forEach((elmt) {
      elmt.forEach((element) {
        if (element['status'] != 'filled') {
          element.update('status', (value) => 'available');
        }
      });
    });
  }

  void gantiWagon(int indexGerbongTerpilih) {
    indexWagon.value = indexGerbongTerpilih;
    Wagon.refresh();
  }

  var indexKusci;
  void selectKursi(int indexKursiTerpilih) {
    print(Wagon[indexWagon.value][indexKursiTerpilih]);

    if (Wagon[indexWagon.value][indexKursiTerpilih]['status'] == 'available') {
      reset();
      Wagon[indexWagon.value][indexKursiTerpilih]
          .update('status', (value) => 'selected');
    }
    indexKusci = indexKursiTerpilih + 1;
    Wagon.refresh();
  }

  var Wagon = List.generate(
    6,
    (indexWagon) => List<Map<String, dynamic>>.generate(
      50,
      (indexKursi) {
        if (indexWagon == 0) {
          // if ((indexKursi >= 4 && indexKursi <= 19) ||
          //     (indexKursi >= 30 && indexKursi <= 45)) {
          //   return {
          //     "id": "ID-${indexWagon + 1}-${indexKursi + 1}",
          //     "status": "filled",
          //   };
          // } else {
          return {
            "id": "ID-${indexWagon + 1}-${indexKursi + 1}",
            "status": "available",
          };
          //}
        } else if (indexWagon == 1) {
          // if (indexKursi >= 5 && indexKursi <= 20) {
          //   return {
          //     "id": "ID-${indexWagon + 1}-${indexKursi + 1}",
          //     "status": "filled",
          //   };
          // } else {
          return {
            "id": "ID-${indexWagon + 1}-${indexKursi + 1}",
            "status": "available",
          };
          //}
        } else {
          return {
            "id": "ID-${indexWagon + 1}-${indexKursi + 1}",
            "status": "available",
            // indexKursi1 =${indexKursi + 1},
          };
        }
      },
    ),
  ).obs;
}
