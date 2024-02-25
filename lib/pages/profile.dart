import 'package:agriconnect/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Loading..."; // Initialize with an empty string

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  final storageRef = FirebaseStorage.instance.ref();

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        username = userData['name']; 
      });
    }
  }

  Future<List<String>> getImagesFromFirebaseStorage() async {
    List<String> imageURLs = [];
    Reference imagesRef = storageRef.child('images');
    ListResult result = await imagesRef.listAll();
    await Future.forEach(result.items, (Reference imageRef) async {
      String downloadURL = await imageRef.getDownloadURL();
      imageURLs.add(downloadURL);
    });

    return imageURLs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
            title: const CustomText(label: 'Profile'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: CircleAvatar(
                        radius: 50,
                        foregroundImage: AssetImage('assets/icons/man.png'),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              username, // Display the dynamic username
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              'Farm Owner, Crops Expert',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CusTButton(label: 'Contact'),
                      SizedBox(
                        width: 15,
                      ),
                      CusTButton(label: 'Follow'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: secondaryColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Posts',
                          style: TextStyle(
                            fontSize: 25,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 25,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                            fontSize: 25,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Photos'),
                          Tab(text: 'Videos'),
                          Tab(text: 'Collections'),
                        ],
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        indicatorColor: primaryColor,
                      ),
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                          children: [
                            FutureBuilder(
                              future: getImagesFromFirebaseStorage(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(child: Text('Error: ${snapshot.error}'));
                                } else {
                                  List<String> imageURLs = snapshot.data as List<String>;
                                  return GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 4.0,
                                      mainAxisSpacing: 4.0,
                                    ),
                                    itemCount: imageURLs.length,
                                    itemBuilder: (context, index) {
                                      return Image.network(imageURLs[index], fit: BoxFit.cover);
                                    },
                                  );
                                }
                              },
                            ),
                            Center(
                              child: Text(
                                'Videos Content',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Collections Content',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CusTButton extends StatelessWidget {
  final String label;

  const CusTButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: primaryColor),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String label;

  const CustomText({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }
}
