import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signio/constants.dart';
import 'package:signio/history/History_screen.dart';
import 'package:signio/general_home_page/general_home.dart';
import 'package:signio/profile/profile_screen.dart';
import 'package:signio/unput_signature/input_signature.dart';

const Color inActiveIconColor = Colors.white;

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static const String routeName='/InitScreen';

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    GeneralHomeScreen(),
    HistoryScreen(),
    InputSignature(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home-1-svgrepo-com.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/home-1-svgrepo-com.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Bill Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Bill Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "history",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/signature-svgrepo-com.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/signature-svgrepo-com.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Add Signature",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "profile",
          ),
        ],
      ),
    );
  }
}