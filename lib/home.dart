import 'package:flutter/material.dart';
import 'package:pbb_wespend/navbar/homePage.dart';
import 'package:pbb_wespend/navbar/laporan.dart';
import 'package:pbb_wespend/navbar/limitPage.dart';
import 'package:pbb_wespend/navbar/profilePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  final _pgc = PageController(initialPage: 0);

  bool _isAddExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pgc,
          onPageChanged: (i) {
            setState(() {
              _current = i;
            });
          },
          children: const [
            HomePage(),
            LaporanPage(),
            LimitPage(),
            ProfilePage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        onTap: (index) {
          if (index == 2) {
            setState(() {
              _isAddExpanded = !_isAddExpanded;
            });
          } else {
            setState(() {
              _current = index;
              _isAddExpanded = false;
            });
            _pgc.jumpToPage(index);
          }
        },
        backgroundColor: Colors.yellow[600],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'limit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: _isAddExpanded
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // Aksi saat tombol "Add" di popup ditekan
                    print('Add Button Pressed');
                  },
                  heroTag: null,
                  child: Icon(Icons.add),
                ),
                const SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: () {
                    // Aksi saat tombol "Expands" di popup ditekan
                    print('Expands Button Pressed');
                  },
                  heroTag: null,
                  child: Icon(Icons.expand),
                ),
              ],
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
