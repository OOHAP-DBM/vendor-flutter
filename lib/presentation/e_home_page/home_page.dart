import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/dashboard_screen/dashboard_screen.dart';
import 'package:oohapp/presentation/e_home_page/profile_screen/profile_screen.dart';
import 'package:oohapp/presentation/e_home_page/widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _pages = [
    const DashboardScreen(),
    Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.red,
      ),
    ),
    Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.green,
      ),
    ),
     ProfileScreen(),
  ];

  int _currentIndex = 0;

  void _changePages(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
     // resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _currentIndex,
        onTabChange: _changePages,
      ),
      body: _pages[_currentIndex],
    );
  }
}
