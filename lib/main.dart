import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/UsersPage.dart';
import 'provider/fetchdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => FetchDataProvider()),
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: UsersPage(title: 'UserApp'),
        ));
  }
}
