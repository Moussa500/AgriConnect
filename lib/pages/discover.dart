// ignore_for_file: use_super_parameters, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const CustomText(label: 'Discover'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(child: SearchField(label: 'Search for tips and tricks and people')),
          Expanded(
            child: DefaultTabController(
              initialIndex: 1,
              length: 5, // Changed to 5 for 5 tabs
              child: Column(
                children: [
                  const TabBar(
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    tabs: [
                      Tab(text: 'Tips'),
                      Tab(text: 'Top'),
                      Tab(text: 'Popular'),
                      Tab(text: 'Latest'),
                      Tab(text: 'Upcoming'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        TipsPage(),
                        TopPage(),
                        const CustomPage('Popular Page'),
                        const CustomPage('Latest Page'),
                        const CustomPage('Upcoming Page'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tips Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Top Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CustomPage extends StatelessWidget {
  final String pageTitle;

  const CustomPage(this.pageTitle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        pageTitle,
        style: const TextStyle(fontSize: 24),
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
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Adjust the color as needed
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final String label;

  const SearchField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
