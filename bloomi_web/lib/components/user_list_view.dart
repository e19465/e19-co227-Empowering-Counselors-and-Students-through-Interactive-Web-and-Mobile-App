import 'package:bloomi_web/providers/user_home_provider/user_appoinment_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/dashboard/dashboard.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 21},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 23},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 24},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  bool _isSearchBarTapped = false; // Added flag

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  void _closeDropdown() {
    setState(() {
      _isSearchBarTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final currentWidth = mediaQueryData.size.width;
    final currentHeight = mediaQueryData.size.height;

    return Consumer<UserAppoinmentProvider>(builder: (context, value, child) {
      return Row(
        children: [
          Container(
            height: (currentWidth < 900) ? 27 : 35,
            margin: currentWidth > 500
                ? (const EdgeInsets.symmetric(horizontal: 100))
                : const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              onTap: () {
                setState(() {
                  _isSearchBarTapped = true;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 10.0, left: 10),
                filled: true,
                fillColor: UtilConstants.lightgreyColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  gapPadding: 8,
                  borderSide: BorderSide.none,
                ),
                labelText: 'Select a Student',
                labelStyle: TextStyle(
                    color: UtilConstants.primaryColor,
                    fontSize: (currentWidth < 900) ? 12 : 16),
                suffixIcon: Icon(
                  Icons.search,
                  color: UtilConstants.primaryColor,
                  size: (currentWidth < 900) ? 12 : 16,
                ),
              ),
              style: TextStyle(
                  fontSize: (currentWidth < 900)
                      ? 12
                      : 16), // Set font size for the content
              cursorWidth: 1.8, // Set cursor width
              cursorHeight: (currentWidth < 900) ? 14 : 18,
            ),
          ),
          SizedBox(
            height: currentHeight * 0.015,
          ),
          Expanded(
            child: _isSearchBarTapped
                ? (_foundUsers.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) => Container(
                          height: 60, // Specify the desired height here
                          child: Card(
                            key: ValueKey(_foundUsers[index]["id"]),
                            color: UtilConstants.tropicalBlurColor,
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: ListTile(
                              onTap: () {
                                // Update next appointment field with relevant student's next appointment
                                _closeDropdown();
                              },
                              leading: Text(
                                _foundUsers[index]["id"].toString(),
                                style: TextStyle(
                                    fontSize: (currentWidth < 750) ? 10 : 15),
                              ),
                              title: Text(
                                _foundUsers[index]['name'],
                                style: TextStyle(
                                    fontSize: (currentWidth < 750) ? 10 : 15),
                              ),
                              subtitle: Text(
                                '${_foundUsers[index]["age"].toString()} years old',
                                style: TextStyle(
                                    fontSize: (currentWidth < 750) ? 10 : 15),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(
                        'No results found',
                        style:
                            TextStyle(fontSize: (currentWidth < 750) ? 10 : 15),
                      ))
                : Container(),
          ),
        ],
      );
    });
  }
}