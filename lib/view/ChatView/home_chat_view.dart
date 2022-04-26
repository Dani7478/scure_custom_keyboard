import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scure_costom_keyboard/all_links.dart';
import 'package:scure_costom_keyboard/view/ChatView/indivisual_message_view.dart';

class HomeChatView extends StatefulWidget {
  @override
  _HomeChatViewState createState() => _HomeChatViewState();
}

class _HomeChatViewState extends State<HomeChatView> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        //centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        //backgroundColor: Colors.purple,
        flexibleSpace: Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        bottom: const TabBar(
          //isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          tabs: [
            Tab(icon: Icon(Icons.message), text: 'Messages'),
            Tab(icon: Icon(Icons.star), text: 'Feed'),
            Tab(icon: Icon(Icons.face), text: 'Profile'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
      body: TabBarView(
        children: [
          buildPage1('Home Page'),
          buildPage2('Feed Page'),
          buildPage3('Profile Page'),
          buildPage4('Settings Page'),
        ],
      ),
    ),
  );

   buildPage1(String text) {
   return Padding(
     padding:  EdgeInsets.symmetric(vertical: 30, horizontal: 10),
     child:  ListView.builder(
       itemCount: 20,
         itemBuilder: (context,index){
          return GestureDetector(
             onTap: (){
               Get.to(IndivisualMessageView(name: 'Saad Hussain', phonno: '0310549844'));
             },
             child: Padding(
               padding: const EdgeInsets.only(top: 5),
               child: Card(
                 elevation: 30,
                 child: ListTile(
                   leading:CircleAvatar(
                     child: Icon(Icons.person),
                   ),
                   title: Text(
                     "Saad Hussain",
                     style: GoogleFonts.josefinSans(
                       fontSize: 18,
                       fontWeight: FontWeight.w800,
                     ),
                   ),
                   subtitle: Text(
                     "03105499844",
                     style: GoogleFonts.josefinSans(
                       fontSize: 18,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                 ),
               ),
             ),
           );
         }),
   );
  }

  buildPage2(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  buildPage3(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  buildPage4(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}