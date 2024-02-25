import 'package:agriconnect/colors.dart';
import 'package:agriconnect/pages/textfield.dart';
import 'package:flutter/material.dart';

class AddPlant extends StatefulWidget {
  const AddPlant({super.key});

  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(
              child: Icon(
            Icons.arrow_back,
          )),
          actions: [
            GestureDetector(
              child: Image.asset('assets/icons/notification.png'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                child: customText(label: 'Plant'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: CustomField(label: 'Enter plant name'),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                      )),
                  minLines: 4,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              Row(
                children: [
                  Options(
                    label: 'plant',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: ListR(
                      label: 'Location',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Options(
                    label: 'planting',
                  ),
                  ListR(
                    label: 'date',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Options(
                    label: 'Tags',
                  ),
                  const SizedBox(
                    width: 55,
                  ),
                  Button(label: '+ add tag',),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: customText(label: 'Subtask :'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Container(
                  height: 50,
                  decoration:
                      BoxDecoration(border: Border.all(color: secondaryColor)),
                  child: const Row(children: [
                    Icon(
                      Icons.add,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'add New Subtask',
                      style: TextStyle(fontSize: 25),
                    ),
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(label: 'Delete Plant'),
                  const SizedBox(width: 20,),
                  Button(label: 'Save Plant')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String label;
   Button({
    super.key,required this.label
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(17))),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListR extends StatelessWidget {
  String label;
  ListR({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: primaryColor)),
        child: DropdownMenu(
            inputDecorationTheme: const InputDecorationTheme(),
            width: 200,
            label: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
                color: primaryColor,
              ),
            ),
            dropdownMenuEntries: const <DropdownMenuEntry>[
              DropdownMenuEntry(value: 'first_plant', label: 'first_plant')
            ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class Options extends StatelessWidget {
  String label;
  Options({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        label,
        style: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w300,
          fontSize: 25,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class customText extends StatelessWidget {
  String label;
  customText({super.key, required this.label});
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
