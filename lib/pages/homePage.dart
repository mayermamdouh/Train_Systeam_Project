import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../pagesApp/Component.dart';
import '../pagesApp/RegisterPage.dart';
import 'Page1.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

List<String> imgesUrl = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1VMxjh0KHTx1mpqUFrL4abcGIkO_FGi5-7g&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsneSuKHxHgEcrDGGgV2X-SHQh_ZNxADUMsg&usqp=CAU',
  'https://thesavvybackpacker.com/wp-content/uploads/2018/04/train-italy.jpg',
];

int _currentIndex = 0;

int? classLength;
class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF656CEE),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    isTrue = true;
                    _currentIndex = index;
                     isTrue5 =  true;
                    isTrueDeleate = false;
                    isTrueDeleatenotfound = false;
                    isSeatincomplete = false;
                     //print(responseeTicket);



                  },
                );
              },
            ),
            items: imgesUrl
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  'Trains in Egypt',
                                  //  '${titles[_currentIndex]}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const FractionalOffset(1, 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imgesUrl.map((urlOfItem) {
                                  int index = imgesUrl.indexOf(urlOfItem);
                                  return Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndex == index
                                          ? Colors.black
                                          : Colors.grey[300],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 5,
          ),
          isTrue9 ? Container(
            height: 220,
            width: double.infinity,
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                   Stack(
                      children: [
                        Image.network(
                          'https://cdn.vectorstock.com/i/preview-2x/26/80/travel-suitcase-and-train-logo-sticker-or-label-vector-43482680.webp',
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                        SizedBox(height: 8,),
                        Positioned(
                          bottom: 170,
                          right: 16,
                          left: 16,
                          child: Text('Name :\n$Name',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0)),
                        ),
                        Positioned(
                          bottom: 170,
                          right: 16,
                          left: 220,
                          child: Text('Ticket Number :\n${index }',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0)),
                        ),
                        Positioned(
                          bottom: 130,
                          right: 16,
                          left: 16,
                          child: Text('Seat Number :\n$SeatNO',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0)),
                        ),
                        Positioned(
                          bottom: 130,
                          right: 16,
                          left: 220,
                          child: Text('Cart Number :\n$CartNO',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0)),
                        ),
                        Positioned(
                          bottom: 90,
                          right: 16,
                          left: 16,
                          child: Text('Class : \n$Class',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0)),
                        ),
                        Positioned(
                          bottom: 90,
                          right: 16,
                          left: 220,
                          child: Text('Price : \n$Fare EGP',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0)),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 16,
                          left: 16,
                          child: Text('Date And Time \n$DateTim',
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.0),


                          ),
                        ),
                      ],
                    ),

            ),
          ): Container(),
        ],
      ),
    );
  }


}
