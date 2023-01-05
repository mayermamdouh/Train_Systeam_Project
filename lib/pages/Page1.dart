import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Database.dart/Queries.dart';
import '../pagesApp/Component.dart';
import 'package:date_field/date_field.dart';
import 'package:multiselect/multiselect.dart';

import '../pagesApp/RegisterPage.dart';
import 'homePage.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

final conroller = Get.put(TicketController());
//final format = DateFormat("yyyy-MM-dd HH:mm");
var passNamecontroller = TextEditingController();
var passNamecontrolle = TextEditingController();
var indexTicketID = TextEditingController();

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        child: Text("Select Your Class"), value: "Select Your Class"),
    DropdownMenuItem(child: Text("A"), value: "A"),
     DropdownMenuItem(child: Text("B"), value: "B"),
     DropdownMenuItem(child: Text("C"), value: "C"),
  ];
  return menuItems;
}


String selectedValue = "Select Your Class";
String valueIWant0 = responsee![0]["Destnation"];
String valueIWant1 = responsee![1]["Destnation"];
String valueIWant2 = responsee![2]["Destnation"];
List<DropdownMenuItem<String>> get dropdownItems2 {
  List<DropdownMenuItem<String>> menuItems2 = [
     DropdownMenuItem(
        child: Text("Select Your Destination"),
        value: "Select Your Destination"),
     DropdownMenuItem(child: Text(valueIWant0), value: valueIWant0),
     //DropdownMenuItem(child: Text(valueIWant1), value: valueIWant1),
    // DropdownMenuItem(child: Text(valueIWant2), value: valueIWant2),
  ];
  return menuItems2;
}
bool isTrueColor = false;

String selectedValue2 = "Select Your Destination";
//var indexKursi;

@override
void initState() {
  print("initState Called");


}

SqlDb sqldb = SqlDb();
String? Price;
late DateTime Date;
var FormKey3 = GlobalKey<FormState>();
List<Map>? responseeTicket;
class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Form(
              key: FormKey3,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Your \nTicket',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333E63),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.train_sharp,
                                size: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ItemStatus(
                            Textt: 'Availble',
                            color: Colors.black12,
                          ),
                          ItemStatus(
                            Textt: 'Selected',
                            color: Color(0xFF656CEE),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          isSeatincomplete ? Text('This Seat Not Avaliable please Choss Another Seat',style:TextStyle(fontWeight: FontWeight.bold) ,):Container(),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Wagon',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 31),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'A',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'B',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'C',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'D',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'E',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Obx(
                                        () => Column(
                                          children: List.generate(
                                            conroller.Wagon.length,
                                            (index) => GestureDetector(
                                              onTap: () =>
                                                  conroller.gantiWagon(index),
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                    color: conroller.indexWagon
                                                                .value ==
                                                            index
                                                        ? Color(0xFF656CEE)
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                    child: Text(
                                                  '${index + 1}',
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Obx(
                                        () => GridView.builder(
                                          padding: EdgeInsets.all(10),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            crossAxisCount: 5,
                                          ),
                                          itemCount: conroller
                                              .Wagon[conroller.indexWagon.value]
                                              .length,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                            onTap: () =>
                                                conroller.selectKursi(index),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: conroller.Wagon[conroller
                                                                  .indexWagon
                                                                  .value][index]
                                                              ['status'] ==
                                                          "available"
                                                      ? Colors.black12
                                                      : conroller.Wagon[conroller
                                                                      .indexWagon
                                                                      .value][index]
                                                                  ['status'] ==
                                                              "filled"
                                                          ? Color(0xFFFF8B2D)
                                                          : Color(0xFF656CEE),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                            ),
                                          ),
                                        ),
                                      ),
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
                  SizedBox(height: 10),
                  Container(
                    height: 240,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              //isSeatincomplete ? Text('This Seat Not Avaliable please Choss Another Seat',style:TextStyle(fontWeight: FontWeight.bold) ,):Container(),
                              SizedBox(height: 5,),
                              Container(
                                height: 70,
                                width: 300,
                                child: DateTimeFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(
                                      Icons.event_note,
                                      color: Color(0xFF656CEE),
                                    ),
                                    labelText: ' Date and Time ',
                                  ),
                                  autovalidateMode: AutovalidateMode.always,
                                  onDateSelected: (DateTime value) {
                                    print(value);
                                    Date = value;
                                  },
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 300,
                                child: TextButtom(
                                  controller: passNamecontroller,
                                  icon: Icons.person,
                                  lable: 'Name',
                                  type: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Passenger name must be not empty';
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 85,
                                width: 300,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    // dropdownColor: Colors.blueAccent,
                                    value: selectedValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                        if (selectedValue == "A") {
                                          Price = "120";
                                        } else if (selectedValue == "B") {
                                          Price = "100";
                                        } else {
                                          Price = "80";
                                        }
                                        ;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Class must be not empty';
                                      }
                                    },
                                    items: dropdownItems),
                              ),
                              Container(
                                height: 85,
                                width: 300,
                                child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF656CEE), width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF656CEE), width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    // dropdownColor: Colors.blueAccent,
                                    value: selectedValue2,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue2 = newValue!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Destination must be not empty';
                                      }
                                    },
                                    items: dropdownItems2),
                              ),
                              Text(
                                'Price : $Price ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF656CEE),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              isTrue
                                  ? ElevatedButton(
                                      onPressed: () async {
                                        if (FormKey3.currentState!.validate()) {
                                          Name = passNamecontroller.text;
                                          SeatNO = "${conroller.indexKusci}";
                                          CartNO =
                                              "${conroller.indexWagon.value + 1}";
                                          DateTim = "$Date";
                                          Class = selectedValue;
                                          Fare = "$Price";
                                          Destination = selectedValue2;
                                          // TicketNo = index;
                                          setState(() {
                                            isTrue = false;

                                          });
                                          isTrue9 = true;
                                          index++;

                                          List<Map> res =
                                          await sqldb.ReadDataFromDatabase(
                                              "select * from 'Ticket' WHERE SeatNO = '${conroller.indexKusci}' ");
                                          print(res);
                                          print('${conroller.indexKusci}');




                                          if(res.isEmpty){
                                            int response = await sqldb
                                                .InsertDataFromDatabase(
                                                "INSERT INTO Ticket VALUES ($index,${conroller.indexKusci},'${passNamecontroller.text}',${conroller.indexWagon.value + 1},'${Date}','${selectedValue}',$Price,'Internet','${selectedValue2}')");
                                            print(response);
                                            print('User Ticket success');
                                            isSeatincomplete = false;

                                          }else if (res.isNotEmpty){
                                            setState(() {
                                              isTrue = true;
                                              isSeatincomplete = true;
                                            });
                                          }
                                          print('${conroller.Wagon[0]}');
                                          responseeTicket =
                                              await sqldb.ReadDataFromDatabase(
                                                  "select * from 'Ticket' ");
                                          print(responseeTicket);
                                        }
                                      },
                                      child: Text('Book now'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF656CEE),
                                        fixedSize: Size(Get.width * 0.8, 40),
                                      ),
                                    )
                                  : const Center(
                                          child: Text(
                                            'Done 👍 Go To Home to Take \n You Ticket',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      SizedBox(height: 10,),
                              Container(
                                height: 50,
                                width: 250,
                                child: TextButtom(
                                  controller: indexTicketID,
                                  icon: Icons.person,
                                  lable: 'Ticket Number To Deleate It ',
                                  type: TextInputType.emailAddress,
                                  validator: (value) {
                                  },
                                ),
                              ),
                              SizedBox(height: 8,),
                              isTrueDeleate? Container():ElevatedButton(
                                        onPressed: () async{
                                          int response = await sqldb
                                              .DeleteDataFromDatabase(
                                              "DELETE FROM Ticket WHERE TicketNO = '${indexTicketID.text}'");
                                          print('Ticket Number ${indexTicketID.text} was Deleted ');
                                          print(response);
                                          if(response.isEqual(0)){
                                            setState(() {
                                              isTrueDeleatenotfound = true;
                                            });
                                          }
                                          if(response.isEqual(1)){
                                            setState(() {
                                              isTrueDeleate = true;
                                            });
                                          }
                                          List<Map> responsee =
                                          await sqldb.ReadDataFromDatabase(
                                              "select * from 'Ticket' ");
                                          print("$responsee");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF656CEE),
                                          fixedSize: Size(Get.width * 0.8, 40),
                                        ),
                                        child: const Text('Cancel Ticket') ,

                              ),
                              isTrueDeleate ? Text('Ticket Number ${indexTicketID.text} was Deleted '):Container() ,
                              isTrueDeleatenotfound?Text('Ticket Number ${indexTicketID.text} not found ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),):Container() ,



                            ],
                            //Container(child: Text('The ticket has been\nsuccessfully cancelled 👍 ',style: TextStyle(fontWeight: FontWeight.bold),),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  const ItemStatus({
    super.key,
    required this.Textt,
    required this.color,
  });

  final String Textt;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12),
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          Textt,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
