import 'package:badi_bahen/advisory/view/advisory.dart';
import 'package:badi_bahen/choose_profession/view/choose_profession.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/bottom_nav_controller.dart';
import '../screens/temp_screens.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ChooseProfession(),
      const Page2(),
      const Page3(),
      const Page3(),
      const Advisory(),
    ];

    return Consumer<BottomNavScreenProvider>(
      builder: (context, snapshot, child) => Scaffold(
        body: pages[snapshot.pageIndex],
        bottomNavigationBar: BottomAppBar(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home screen.
              _buildBottomNavigationBarItem(
                bottomNavIcon: Icons.home,
                pageIndex: 0,
                context: context,
                pageIndexProvider: snapshot,
              ),
              // Financial plan screen.
              _buildBottomNavigationBarItem(
                bottomNavIcon: Icons.search,
                pageIndex: 1,
                context: context,
                pageIndexProvider: snapshot,
              ),
              // Transaction screen.
              _buildBottomNavigationBarItem(
                bottomNavIcon: Icons.notifications,
                pageIndex: 2,
                context: context,
                pageIndexProvider: snapshot,
              ),
              // Advisory screen.
              _buildBottomNavigationBarItem(
                bottomNavIcon: Icons.account_circle,
                pageIndex: 3,
                context: context,
                pageIndexProvider: snapshot,
              ),
              // Monitory screen.
              _buildBottomNavigationBarItem(
                bottomNavIcon: Icons.account_circle,
                pageIndex: 4,
                context: context,
                pageIndexProvider: snapshot,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBarItem({
    required BottomNavScreenProvider pageIndexProvider,
    required IconData bottomNavIcon,
    required int pageIndex,
    required BuildContext context,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 320),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
        gradient: pageIndexProvider.pageIndex == pageIndex
            ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffB32C43),
                  Color(0xffFC9B12),
                ],
              )
            : null,
      ),
      child: IconButton(
        enableFeedback: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          pageIndexProvider.setPageIndex(pageIndex);
        },
        icon: Icon(bottomNavIcon),
      ),
    );
  }
}
