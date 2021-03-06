import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_list/foundation/constants/route.dart';
import 'package:habit_list/hooks/use_l10n.dart';
import 'package:habit_list/hooks/use_router.dart';
import 'package:habit_list/main.dart';
import 'package:habit_list/pages/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:habit_list/pages/timeline_page.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final router = useRouter();
    final userModel = ref.read(authProvider.notifier);

    final bottomTabItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.home), label: l10n.home),
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

    onPressed() {
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
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: SizedBox(
                    width: 260,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          await userModel.logout();
                        },
                        child: Text(l10n.logout),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                        ))),
              ),
            ])),
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
