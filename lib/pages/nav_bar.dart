import 'package:agriconnect/colors.dart';
import 'package:agriconnect/pages/add_plant.dart';
import 'package:agriconnect/pages/discover.dart';
import 'package:agriconnect/pages/home_page.dart';
import 'package:agriconnect/pages/profile.dart';
import 'package:flutter/material.dart';
import '../pages/messenger.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int index = 0;
  List<Widget> pages = [
    const HomePage(),
    const Discover(),
    const AddPlant(),
    const Messenger(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: secondaryColor,
          shape: const CircularNotchedRectangle(),
          height: MediaQuery.sizeOf(context).height * .08,
          notchMargin: 12,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .06,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .3,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index = 3;
                  });
                },
                icon: const Icon(
                  Icons.chat_bubble,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .06,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index = 4;
                  });
                },
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: pages[index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: secondaryColor,
          onPressed: () {
            setState(() {
              index = 2;
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
