import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
    TabItem(icon: Icons.heart_broken_outlined, title: 'My Orders'),
    TabItem(icon: Icons.account_circle_outlined, title: 'Account'),
  ],
  initialActiveIndex: 0,
  onTap: (int i) {
    if(i==0)
      {
        Get.to(AddNewGroup());
        print(i);
      }
    if(i==1)
      {
        Get.to(AddNewMemberScreen());
        print(i);
      }
    },
);
