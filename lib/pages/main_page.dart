import 'package:anime_log/pages/home_page.dart';
import 'package:anime_log/pages/search_page.dart';
import 'package:anime_log/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 国際化対応(L10)

    final bottomTabItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'MyPage',
      ),
    ];

    final pages = [
      const HomePage(),
      const SearchPage(),
      const UserPage()
    ];

    final currentIndex = useState(Pages.home.index);
    final currentPage = useState(pages[currentIndex.value]);

    onTap(index) {
      currentIndex.value = index;
      currentPage.value = pages[index];
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Anime log"),
      ),
      body: currentPage.value,
      floatingActionButton: FloatingActionButton(
        onPressed: () { print("onpressed"); },
        tooltip: 'Add Anime',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabItems,
        currentIndex: currentIndex.value,
        selectedItemColor: Colors.blue,
        onTap: onTap,
      ),
    );
  }
}

enum Pages {
  home,
  search,
  user,
}
