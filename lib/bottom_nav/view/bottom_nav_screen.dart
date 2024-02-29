import 'package:badi_bahen/financial_plan/view/financial_plan.dart';
import 'package:badi_bahen/monitoring/view/monitoring.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../advisory/view/advisory.dart';
import '../../choose_profession/view/choose_profession.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final TextStyle labelStyle = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  // Page lists.
  final pages = [
    const ChooseProfession(),
    const FinancialPlan(),
    const Advisory(),
    const Monitoring(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavScreenProvider>(
      builder: (context, snapShot, child) => Scaffold(
        body: pages[snapShot.pageIndex],
        bottomNavigationBar: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const SizedBox(
              height: 95,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Bottom navigation icon for Home Screen.
                          _bottomNavIcon(
                            bottomNavScreenProvider: snapShot,
                            index: 0,
                            navIconTitle: 'HOME',
                          ),

                          // Bottom navigation icon for Financial Plan Screen.
                          _bottomNavIcon(
                            bottomNavScreenProvider: snapShot,
                            index: 1,
                            navIconTitle: 'FINANCIAL PLAN',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * .2),
                    Expanded(
                      child: Row(
                        children: [
                          // Bottom navigation icon for Advisory Screen.
                          _bottomNavIcon(
                            bottomNavScreenProvider: snapShot,
                            index: 2,
                            navIconTitle: 'ADVISORY',
                          ),

                          // Bottom navigation icon for Monitoring Screen.
                          _bottomNavIcon(
                            bottomNavScreenProvider: snapShot,
                            index: 3,
                            navIconTitle: 'MONITORING',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Floating action button on the bottom center of the screen.us
            _buildFAB()
          ],
        ),
      ),
    );
  }

  Positioned _buildFAB() {
    return Positioned(
      top: 0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              // Border for the FAB.
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    top: BorderSide(color: Colors.red, width: 5),
                    left: BorderSide(color: Colors.red, width: 2),
                    right: BorderSide(color: Colors.red, width: 2),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              // Center yellow color button.
              Positioned(
                bottom: 0,
                child: Container(
                  height: 65,
                  width: 65,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0x000A0707),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text("TRANSACTIONS", style: labelStyle),
        ],
      ),
    );
  }

  // Below widget is for each bottom navigation item.
  IconButton _bottomNavIcon({
    required BottomNavScreenProvider bottomNavScreenProvider,
    required int index,
    required String navIconTitle,
  }) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => bottomNavScreenProvider.setPageIndex(index),
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 320),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: bottomNavScreenProvider.pageIndex == index
                  ? Colors.grey.shade200
                  : Colors.grey.withOpacity(.1),
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                end: Alignment.centerRight,
                colors: [
                  Colors.red,
                  Colors.amber,
                ],
              ),
            ),
            child: Icon(
              Icons.home,
              color: bottomNavScreenProvider.pageIndex == index
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            navIconTitle,
            style: labelStyle.copyWith(
              color: bottomNavScreenProvider.pageIndex == index
                  ? Colors.red
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
