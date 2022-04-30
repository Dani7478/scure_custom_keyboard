import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  int keyNo = 0;
  final List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card1(keyNo));
    });
  }

  void _removeCardWidget() {
    setState(() {
      _cardList.removeAt(keyNo);
    });
  }

  void _addCardWidget2() {
    setState(() {
      _cardList.add(_card2(keyNo));
    });
  }

  void _addCardWidget3() {
    setState(() {
      _cardList.add(_card3(keyNo));
    });
  }

  Widget _card1(no) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 290.0,
        child: Column(
          children: [
            // first row
            Row(
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
            // second row
            Row(
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
            Padding(
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
            // fourth row
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _removeCardWidget();
                    _addCardWidget2();
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
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _removeCardWidget();
                    _addCardWidget3();
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
                const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: SizedBox(
                    width: 150,
                    height: 50,
                  ),
                ),
                _cardButtons('.'),
                const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _card2(no) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 290.0,
        child: Column(
          children: [
            // first row
            Row(
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
            // second row
            Row(
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
            Padding(
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
            // fourth row
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _removeCardWidget();
                    _addCardWidget();
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
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    _removeCardWidget();
                    _addCardWidget3();
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
                const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: SizedBox(
                    width: 150,
                    height: 50,
                  ),
                ),
                _cardButtons('.'),
                const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _card3(no) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 290.0,
        child: Column(
          children: [
            // first row
            Row(
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
            // second row
            Row(
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
            Padding(
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
            // fourth row
            Row(
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
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _removeCardWidget();
                    _addCardWidget();
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
                const Card(
                  elevation: 5,
                  color: Colors.blue,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Keyboard'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            height: size.height - 84,
                            width: size.width,
                            color: Colors.lightBlueAccent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter a search term',
                                  ),
                                  onTap: ()=> WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: _cardList,
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addCardWidget,
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _cardButtons(String txt) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // do something
        },
        child: Card(
          elevation: 5,
          color: Colors.red,
          child: Container(
            height: 40.0,
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
}
