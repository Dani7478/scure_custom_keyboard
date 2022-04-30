import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:scure_costom_keyboard/view/ChatView/my_groups.dart';

import '../all_links.dart';

ConvexAppBar groupNavigator = ConvexAppBar(
  gradient: const LinearGradient(
    colors: [
      Colors.lightBlue,
      Colors.greenAccent,
    ],
  ),
  style: TabStyle.react,
  items: const [
    TabItem(icon: Icons.add, title: 'Add Group'),
    TabItem(icon: Icons.add_comment_rounded, title: 'Add Members'),
    TabItem(icon: Icons.heart_broken_outlined, title: 'My Groups'),
    TabItem(icon: Icons.account_circle_outlined, title: 'All Groups'),
  ],
 // initialActiveIndex: 0,
  onTap: (int i) {
    if(i==0)
      {
        Get.to(AddNewGroup());
        i=0;
      }
    if(i==1)
      {
        Get.to(AddNewMemberScreen());
        i=1;
      }
      if(i==2)
      {
        Get.to(MyGroupsScreen());
        i=1;
      }
    },
);
