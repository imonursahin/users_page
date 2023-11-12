import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/popup.dart';
import '../model/usermodel.dart';
import '../provider/fetchdata.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key, required this.title});
  final String title;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final TextEditingController searchController = TextEditingController();
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    Provider.of<FetchDataProvider>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<FetchDataProvider>(context);
    if (searchController.text.isEmpty) {
      filteredUsers = dataProvider.users.cast<User>().toList();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: dataProvider.isLoading
            ? const Center(
                child: Text(
                'Loading...',
                style: TextStyle(fontSize: 24),
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search',
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ),
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            filteredUsers = dataProvider.users
                                .where((user) => user.username!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .cast<User>()
                                .toList();
                          });
                        },
                      ),
                    ),
                    filteredUsers.isEmpty
                        ? const Center(
                            child: Text(
                            'Kullanıcı Bulunamadı!',
                            style: TextStyle(fontSize: 24),
                          ))
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: ListView.builder(
                              itemCount: filteredUsers.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Popup.showPopup(context,
                                        userData: filteredUsers[index]);
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          filteredUsers[index].profileImage ??
                                              ''),
                                    ),
                                    title:
                                        Text(filteredUsers[index].name ?? ''),
                                    subtitle: Text(
                                        '@${filteredUsers[index].username ?? ''}'),
                                    trailing: Icon(
                                        Icons.keyboard_arrow_right_rounded),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
