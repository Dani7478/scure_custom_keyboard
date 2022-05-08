import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scure_costom_keyboard/all_links.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:intl/intl.dart';

import '../../Widgets/custom_snackbar.dart';
import '../../controller/message_controller.dart';

class IndivisualMessageView extends StatefulWidget {
  final String name;
  final String phonno;

  const IndivisualMessageView({required this.name, required this.phonno});

  @override
  State<IndivisualMessageView> createState() => _IndivisualMessageViewState();
}

Icon floaticon = Icon(Icons.add);
bool _keyboardEnable = false;
int whichcard = 1;
String message = '';
late List ConservationList=[];
late String ownernumber;

class _IndivisualMessageViewState extends State<IndivisualMessageView> {
  //const IndivisualMessageView({Key? key}) : super(key: key);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData() async 
  {
     final prefs = await SharedPreferences.getInstance();
     ownernumber=prefs.getString('phoneno');
     var response=await getSingleConservation(ownernumber,widget.phonno);
     if(response!=false)
     {
        ConservationList=response;
        setState((){});
     }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0f65b3),
        toolbarHeight: 60.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: GoogleFonts.josefinSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.phonno,
              style: GoogleFonts.josefinSans(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              FlatButton(
                onPressed: () async {
                  //encrypt();
                },
                child: const Center(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const Positioned(
                top: 25,
                right: 17,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 6,
                ),
              ),
              Container(),
            ],
          ),
          PopupMenuButton<String>(onSelected: (value) {
            if (value == "logout") {
              //____
            }
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: Color(0xFF0f65b3),
                      ),
                      onPressed: () async {},
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Logout",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                value: "logout",
              ),
            ];
          }),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: _keyboardEnable == false ? 1 : 3,
            child: Container(
              height:1000,
              width: size.width,
              color: Colors.pink,
              child: chatUI(),
            ),
          ),
          _keyboardEnable == false
              ? Container()
              : Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: whichcard == 0
                        ? _card1()
                        : whichcard == 1
                            ? _card2()
                            : _card3(),
                  ),
                ),
        ],
      ),
      floatingActionButton: _keyboardEnable == true
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                if (_keyboardEnable == false) {
                  _keyboardEnable = true;
                  floaticon = Icon(Icons.remove);
                } else {
                  _keyboardEnable = false;
                  floaticon = Icon(Icons.add);
                }
                setState(() {});
              },
              child: floaticon,
              backgroundColor: Colors.redAccent,
            ),
    );
  }

  MessageDetail1(Size size) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: size.width / 1.5,
        height: size.height / 12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2),
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.red],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
      ),
    );
  }

  Widget _card1() {
    return Card(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            // first row
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
                ),
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  _cardButtons('1'),
                  _cardButtons('2'),
                  _cardButtons('3'),
                  _cardButtons('4'),
                  _cardButtons('5'),
                  _cardButtons('6'),
                  _cardButtons('7'),
                  _cardButtons('8'),
                  _cardButtons('9'),
                  _cardButtons('0'),
                ],
              ),
            ),
            // second row
            Expanded(
              child: Row(
                children: [
                  _cardButtons('Q'),
                  _cardButtons('W'),
                  _cardButtons('E'),
                  _cardButtons('R'),
                  _cardButtons('T'),
                  _cardButtons('Y'),
                  _cardButtons('U'),
                  _cardButtons('I'),
                  _cardButtons('O'),
                  _cardButtons('P'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    _cardButtons('A'),
                    _cardButtons('S'),
                    _cardButtons('D'),
                    _cardButtons('F'),
                    _cardButtons('G'),
                    _cardButtons('H'),
                    _cardButtons('J'),
                    _cardButtons('K'),
                    _cardButtons('L'),
                  ],
                ),
              ),
            ),
            // fourth row
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //_removeCardWidget();
                      // _addCardWidget2();
                      whichcard = 1;
                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_upward),
                      ),
                    ),
                  ),
                  _cardButtons('Z'),
                  _cardButtons('X'),
                  _cardButtons('C'),
                  _cardButtons('V'),
                  _cardButtons('B'),
                  _cardButtons('N'),
                  _cardButtons('M'),
                  InkWell(
                      onTap: () {
                      if (message!= null && message.length > 0) {
                        message = message.substring(0, message.length - 1);
                        setState((){});
                      }
                    },
                    onLongPress: ()
                    {
                      message='';
                      setState((){});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //  _removeCardWidget();
                      // _addCardWidget3();
                    },
                    child: InkWell(
                      onTap: (){
                        whichcard=2;
                      },
                      child: const Card(
                        elevation: 5,
                        color: Colors.blue,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Text('!#1'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _cardButtons('&'),
                  _cardButtons(','),
                  const Card(
                    elevation: 5,
                    color: Colors.blue,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                    ),
                  ),
                  _cardButtons('.'),
                  InkWell(
                    onTap: () {
                      _keyboardEnable = false;
                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_forward),
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

  Widget _card2() {
    return Card(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
                ),
              ),
            )),
            // first row
            Expanded(
              child: Row(
                children: [
                  _cardButtons('1'),
                  _cardButtons('2'),
                  _cardButtons('3'),
                  _cardButtons('4'),
                  _cardButtons('5'),
                  _cardButtons('6'),
                  _cardButtons('7'),
                  _cardButtons('8'),
                  _cardButtons('9'),
                  _cardButtons('0'),
                ],
              ),
            ),
            // second row
            Expanded(
              child: Row(
                children: [
                  _cardButtons('q'),
                  _cardButtons('w'),
                  _cardButtons('e'),
                  _cardButtons('r'),
                  _cardButtons('t'),
                  _cardButtons('y'),
                  _cardButtons('u'),
                  _cardButtons('i'),
                  _cardButtons('o'),
                  _cardButtons('p'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    _cardButtons('a'),
                    _cardButtons('s'),
                    _cardButtons('d'),
                    _cardButtons('f'),
                    _cardButtons('g'),
                    _cardButtons('h'),
                    _cardButtons('j'),
                    _cardButtons('k'),
                    _cardButtons('l'),
                  ],
                ),
              ),
            ),
            // fourth row
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // _removeCardWidget();
                      // _addCardWidget();

                      whichcard = 0;

                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_upward),
                      ),
                    ),
                  ),
                  _cardButtons('z'),
                  _cardButtons('x'),
                  _cardButtons('c'),
                  _cardButtons('v'),
                  _cardButtons('b'),
                  _cardButtons('n'),
                  _cardButtons('m'),
                  InkWell(
                    onTap: () {
                      if (message!= null && message.length > 0) {
                        message = message.substring(0, message.length - 1);
                        setState((){});
                      }
                    },
                    onLongPress: ()
                    {
                      message='';
                      setState((){});
                    },

                    child: InkWell(
                        onTap: () {
                      if (message!= null && message.length > 0) {
                        message = message.substring(0, message.length - 1);
                        setState((){});
                      }
                    },
                    onLongPress: ()
                    {
                      message='';
                      setState((){});
                    },
                      child: const Card(
                        elevation: 5,
                        color: Colors.blue,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // _removeCardWidget();
                      //_addCardWidget3();
                      whichcard = 3;
                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text('!#1'),
                        ),
                      ),
                    ),
                  ),
                  _cardButtons('&'),
                  _cardButtons(','),
                  InkWell(
                    onTap: () {
                      message = message + ' ';
                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 150,
                        height: 50,
                      ),
                    ),
                  ),
                  _cardButtons('.'),
                  InkWell(
                    onTap: () {
                      _keyboardEnable = false;
                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      SentMessage();
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_forward),
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

  Widget _card3() {
    return Card(
      child: Container(
        width: double.infinity,
        // height: 290.0,
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.white),
                ),
              ),
            )),
            // first row
            Expanded(
              child: Row(
                children: [
                  _cardButtons('1'),
                  _cardButtons('2'),
                  _cardButtons('3'),
                  _cardButtons('4'),
                  _cardButtons('5'),
                  _cardButtons('6'),
                  _cardButtons('7'),
                  _cardButtons('8'),
                  _cardButtons('9'),
                  _cardButtons('0'),
                ],
              ),
            ),
            // second row
            Expanded(
              child: Row(
                children: [
                  _cardButtons('+'),
                  _cardButtons('x'),
                  _cardButtons('÷'),
                  _cardButtons('='),
                  _cardButtons('/'),
                  _cardButtons('_'),
                  _cardButtons('€'),
                  _cardButtons('£'),
                  _cardButtons('¥'),
                  _cardButtons('₩'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    _cardButtons('!'),
                    _cardButtons('@'),
                    _cardButtons('#'),
                    _cardButtons('\$'),
                    _cardButtons('%'),
                    _cardButtons('^'),
                    _cardButtons('&'),
                    _cardButtons('*'),
                    _cardButtons('('),
                    _cardButtons(')'),
                  ],
                ),
              ),
            ),
            // fourth row
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text('1/2'),
                        ),
                      ),
                    ),
                  ),
                  _cardButtons('-'),
                  _cardButtons('\''),
                  _cardButtons('"'),
                  _cardButtons(':'),
                  _cardButtons(';'),
                  _cardButtons(','),
                  _cardButtons('?'),
                  const Card(
                    elevation: 5,
                    color: Colors.blue,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //_removeCardWidget();
                      //_addCardWidget();
                      whichcard = 1;
                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text('ABC'),
                        ),
                      ),
                    ),
                  ),
                  _cardButtons('&'),
                  _cardButtons(','),
                  const Card(
                    elevation: 5,
                    color: Colors.blue,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                    ),
                  ),
                  _cardButtons('.'),
                  InkWell(
                    onTap: () {
                      _keyboardEnable = false;
                      setState(() {});
                    },
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      elevation: 5,
                      color: Colors.blue,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.arrow_forward),
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

  _cardButtons(String txt) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // do something
          message = message + txt;
          setState(() {});
        },
        child: Card(
          elevation: 5,
          color: Colors.red,
          child: Container(
            height: 30.0,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Center(
              child: Text(
                txt,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // int keyNo = 0;
  // final List<Widget> _cardList = [];

  SentMessage() async {
    final prefs = await SharedPreferences.getInstance();
    //___________Date Time
    DateTime now = DateTime.now();
    String Date = DateFormat('EEE d MMM').format(now);
    String time = now.hour.toString() + ":" + now.minute.toString();
    print(time);
    print(Date);
    String sender = prefs.getString('phoneno');
    String reciever = widget.phonno;
    print('Sender: $sender \n reciever: $reciever');
    var cryptor = PlatformStringCryptor();
    final salt = await cryptor.generateSalt();
    String key = await cryptor.generateKeyFromPassword(message, salt);
    String encryptMessage = await encryptText(key);
    var data = {
      'sender': sender,
      'reciever': reciever,
      'date': Date,
      'time': time,
      'publickey': 'NULL',
      'privatekey': key,
      'message1': encryptMessage,
      'status': '0',
    };
    bool result = await addNewMessage(data);
    if (result == true) {
      showSnackBar(context, 'Message Sent', 'Ok');
      getData();
    }

     String decryptedText =await decryptText(encryptMessage,key);
  }

  encryptText(String key) async {
    var cryptor = PlatformStringCryptor();
    // here pass the password entered by user and the key
    var encryptMessage = await cryptor.encrypt(message, key);
    print(encryptMessage);
    return encryptMessage;
  }

  decryptText(String encryptedText, String key) async {
    var cryptor = PlatformStringCryptor();
    try {
      final String decryptedMessage = await cryptor.decrypt(encryptedText, key);
      print(decryptedMessage); // - A string to encrypt.
      return decryptedMessage;
    } on MacMismatchException {
      // unable to decrypt (wrong key or forged data)
    }
  }

  chatUI() {

    return ConservationList.length==0 ? Center(child: CircularProgressIndicator(),): ListView.builder(
      itemCount:ConservationList.length ,
      itemBuilder: (context,index){
        String message1=ConservationList[index]['message1'];
        String key=ConservationList[index]['privatekey'];
     
        return InkWell(
          onLongPress: () async{
          // String decMessage= await decryptText(ConservationList[index]['message'], ConservationList[index]['privatekey']);
           String decryptedText =await decryptText(message1,key);
           message=decryptedText.toString();
           setState((){});
          print(decryptedText);
          },
          child: Container(
               //height:120,
          child: Padding(
            padding:
            ownernumber!=ConservationList[index]['sender'] ?
             EdgeInsets.only( right: 75, left: 8.0, top: 8.0, bottom: 8.0):
             EdgeInsets.only( left: 75, right: 8.0, top: 8.0, bottom: 8.0) ,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              child: Container(
                color: ownernumber!=ConservationList[index]['sender'] ?Colors.greenAccent : Colors.blueAccent,
                child: Stack(
                  children: <Widget>[
                    // !isImage
                    //     ? Padding(
                    //   padding: const EdgeInsets.only(
                    //       right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                    //   child: Text(
                    //     content,
                    //   ),
                    // )
                    //     :
                         Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ConservationList[index]['message1'],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 10,
                      child: Text(
                        '11:10',
                        style: TextStyle(
                            fontSize: 10, color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
        );

      });
  }
}


