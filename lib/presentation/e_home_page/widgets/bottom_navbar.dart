import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavbar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: BottomNavigationBar(
      //  backgroundColor: Colors.red ,
        type: BottomNavigationBarType.fixed,
       // backgroundColor: Color.fromARGB(255, 193, 209, 240),
        selectedItemColor: CustomColors.blackColor,
        unselectedItemColor: CustomColors.grey,
        //type: BottomNavigationBarType.shifting,
        onTap: onTabChange,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        elevation: 0,
        /*selectedFontSize: 0.0,
        unselectedFontSize: 0.0,*/
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_outlined),
            label: 'Hoardings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chatting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );

    /*   return NavigationBar(
      elevation: 0,
      selectedIndex: selectedIndex,
      onDestinationSelected: onTabChange,
      indicatorColor: CustomColors.blackColor.withOpacity(0.1),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Dashboard',
        ),
        NavigationDestination(
          icon: Icon(Icons.tv_outlined),
          label: 'Hoardings',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chatting',
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_outlined),
          label: 'Profile',
        )
      ],
    );*/

    /* return GNav(
        onTabChange: onTabChange,
        selectedIndex: selectedIndex,
        activeColor: CustomColors.buttonColor,
        color: CustomColors.grey,
        gap: 5,
        padding: const EdgeInsets.all(15.0),
        curve: Curves.easeInOutSine,
       */ /* tabActiveBorder:
            const Border(top: BorderSide(color: CustomColors.blackColor)),
        tabBorderRadius: 1.0,
        backgroundColor: CustomColors.whiteColor,
          tabBorder:
              const Border(top: BorderSide(color: CustomColors.blackColor)),*/ /*
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: 'Dashboard',
          ),
          GButton(
            icon: Icons.tv_outlined,
            text: 'Hoardings',
          ),
          GButton(
            icon: Icons.chat_bubble_outline,
            text: 'Chatting',
          ),
          GButton(
            icon: Icons.menu_outlined,
            text: 'Profile',
          ),
        ]);*/

    /*return DotNavigationBar(
    //  marginR:const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
*/ /*
      paddingR:const EdgeInsets.only(bottom: 5, top: 10),

      borderRadius:30,
      margin:const EdgeInsets.symmetric(horizontal: 50, vertical: 20),

      backgroundColor : Colors.white, enableFloatingNavBar:true, enablePaddingAnimation:true,*/ /*
      //backgroundColor: CustomColors.blackColor,
     // paddingR: EdgeInsets.all(10.0),
     // itemPadding: EdgeInsets.all(10.0),


      onTap: onTabChange,
      currentIndex: selectedIndex,
      // dotIndicatorColor: Colors.black,
      items: [
        /// Home
        DotNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          selectedColor: Colors.purple,
        ),

        /// Likes
        DotNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          selectedColor: Colors.pink,
        ),

        /// Search
        DotNavigationBarItem(
          icon: Icon(Icons.search),
          selectedColor: Colors.orange,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: Icon(Icons.person),
          selectedColor: Colors.teal,
        ),
      ],
    );*/
/*
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0), color: Colors.red),
        child: CustomNavigationBar(
          // iconSize: 30.0,
          selectedColor: Color(0xff040307),
          strokeColor: Color(0x30040307),
          unSelectedColor: Color(0xffacacac),
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              title: CustomText.bodyText(text: 'Dashboard'),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.tv_outlined),
              title: CustomText.bodyText(text: 'Hoardings'),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              title: CustomText.bodyText(text: 'Chatting'),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.menu_outlined),
              title: CustomText.bodyText(text: 'Profile'),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onTabChange,
        ),
      ),
    );*/
  }
}
