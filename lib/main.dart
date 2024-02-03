import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'App Store Simulation',
      home: AppStoreScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppStoreScreen extends StatelessWidget {
  const AppStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Shopping Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          )
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        late Widget targetPage;
        switch (index) {
          case 0:
            targetPage = const SearchPage();
            break;
          case 1:
            targetPage = const CartPage();
            break;
          case 2:
            targetPage = const HomeScreen();
            break;
          case 3:
            targetPage = const ProfilePage();
            break;
          case 4:
            targetPage = const SettingsPage();
            break;
          default:
            targetPage = const HomeScreen();
            break;
        }
        return CupertinoTabView(builder: (BuildContext context) {
          return CupertinoPageScaffold(
            child: targetPage,
          );
        });
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('App Store'),
      ),
      child: ListView(
        children: const <Widget>[
          HeaderSection(),
          LargeImageCard(),
          CupertinoListTile('Instagram', ' 1', Icons.apps),
          CupertinoListTile('Whatsapp', ' 2', Icons.camera),
          SmallImageCard(),
          CupertinoListTile('Hi 5', ' 3', Icons.message),
          CupertinoListTile('USLA NAV', ' 4', Icons.music_note),
          CupertinoListTile('Hola no se que poner', ' 5', Icons.map),
          CupertinoListTile('Ya bai', ' 6', Icons.phone),
          LargeImageCard(),
          CupertinoListTile('Amo a mi novia', ' 7', Icons.email),
          CupertinoListTile('????', ' 8', Icons.games),
          CupertinoListTile('Ya suelteme', ' 9', Icons.book),
          CupertinoListTile('Calendario', ' 10', Icons.calendar_today),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          color: CupertinoColors.systemGrey6,
          child: const Text(
            'Esto lo hice con 2 horas de sueño un red bull y 3 tazas de café encima de mi ademas mis facultades mentales no funcionan bien en estos momentos gracias y disfrute mi sufriemiento',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: CupertinoSearchTextField(),
        ),
      ],
    );
  }
}

class LargeImageCard extends StatelessWidget {
  const LargeImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8.0,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('lib/images/instagram.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('lib/images/shein.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallImageCard extends StatelessWidget {
  const SmallImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage('lib/images/snap.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final String appName;
  final String appDescription;
  final IconData icon;

  const CupertinoListTile(this.appName, this.appDescription, this.icon,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    'Get',
                    style: TextStyle(color: CupertinoColors.activeBlue),
                  ),
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      appDescription,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Page'),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: const <Widget>[
            CupertinoListTile('Instagram', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile('Whatsapp', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile('Hi 5', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile('USLA NAV', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile(
                'Hola no se que poner', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile('Ya bai', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile(
                'Amo a mi novia', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile('????', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile(
                'Ya suelteme', 'Ready to Pay', Icons.attach_money),
            CupertinoListTile('Calendario', 'Ready to Pay', Icons.attach_money),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Page'),
    );
  }
}
