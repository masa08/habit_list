import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_list/foundation/constants/route.dart';
import 'package:habit_list/hooks/use_l10n.dart';
import 'package:habit_list/hooks/use_router.dart';
import 'package:habit_list/pages/home_page.dart';
import 'package:habit_list/pages/timeline_page.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final user = FirebaseAuth.instance.currentUser;

    final bottomTabItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: l10n.home
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.timeline),
        label: l10n.timeline,
      ),
    ];

    final pages = [
      const HomePage(),
      const TimeLinePage(),
    ];

    final currentIndex = useState(Pages.home.index);
    final currentPage = useState(pages[currentIndex.value]);

    onPressed () {
      final router = useRouter();
      router.go(RoutePath.add);
    }

    onTap(index) {
      currentIndex.value = index;
      currentPage.value = pages[index];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
      ),
      body: currentPage.value,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(children: [
                Text("email: " + user!.email!)
              ])
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: l10n.add,
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
  timeLine,
}
