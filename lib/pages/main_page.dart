import 'package:anime_log/hooks/use_l10n.dart';
import 'package:anime_log/pages/home_page.dart';
import 'package:anime_log/pages/search_page.dart';
import 'package:anime_log/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();

    final bottomTabItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: l10n.home
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.search),
        label: l10n.search,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: l10n.mypage,
      ),
    ];

    final pages = [
      const HomePage(),
      const SearchPage(),
      const UserPage()
    ];

    final currentIndex = useState(Pages.home.index);
    final currentPage = useState(pages[currentIndex.value]);

    onPressed () {
      print("onPressed");
    }

    onTap(index) {
      currentIndex.value = index;
      currentPage.value = pages[index];
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Text(l10n.title),
      ),
      body: currentPage.value,
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
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
