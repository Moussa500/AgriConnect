import 'package:agriconnect/button.dart';
import 'package:agriconnect/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        'Welcome to AgriConnect!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Connect with the community',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: secondaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: customText(label:'join discussions and share tips',),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 22, top: 22),
                      child: Text(
                        'Engage with fellow farmers',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               SearchField(label: 'Search for topics or plants',),
              const SizedBox(
                height: 15,
              ),
               Padding(
                padding:  const EdgeInsets.only(left: 17),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(label:'Popular topics'),
                ),
              ),
              customListView(context),
               Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(label: 'Plant care reminders')
                ),
              ),
              customListView(context),
               Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(label: 'Categories')
                ),
              ),
              Container(
                height: 50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 30,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                      color: secondaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Container customListView(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17))),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class customText extends StatelessWidget {
  String label;
   customText({
    super.key,required this.label
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: thirdColor,
      ),
    );
  }
}
