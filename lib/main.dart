import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
import 'package:assignment_3/Bloc/Shop/bloc/shop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/Presentation/Pages/Home.dart';
import 'package:assignment_3/Presentation/Pages/History.dart';
import 'package:assignment_3/Presentation/Pages/Profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ShopBloc>(
          create: (context) => ShopBloc(),
          child: BlocProvider<CartBloc>(
            create: (context) => CartBloc(),
            child: const MainPage(),
          )),
      // routes: <String, WidgetBuilder>{
      //   '/home': (BuildContext context) => const Home(),
      //   '/history': (BuildContext context) => const History(),
      //   '/profile': (BuildContext context) => const Profile(),
      // },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = const Home();
    switch (index) {
      case 0:
        child = const Home();
        break;
      case 1:
        child = const History();
        break;
      case 2:
        child = const Profile();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping Spree",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SizedBox.expand(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => index = newIndex),
        currentIndex: index,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        selectedFontSize: 18,
        unselectedFontSize: 13,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.face),
          ),
        ],
      ),
    );
  }
}
