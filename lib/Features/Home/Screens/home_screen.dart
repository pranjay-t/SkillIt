import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:skill_it/Constants/ad_card.dart';
import 'package:skill_it/Constants/search_result.dart';
import 'package:skill_it/Features/Learning/learning_screen.dart';
import 'package:skill_it/Features/Professional/professional_screen.dart';
import 'package:skill_it/Features/Home/Drawer/menu_drawer.dart';
import 'package:skill_it/Features/Notifications/notification_dialog.dart';
import 'package:skill_it/Features/Home/Screens/continue_learning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void displayMenuDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

void displayNotificationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const NotificationDialog();
    },
  );
}

void navigateToLearning(BuildContext context) {
  Routemaster.of(context).push('/learning');
}

void navigateToProfessional(BuildContext context) {
  Routemaster.of(context).push('/professional');
}

class _HomeScreenState extends State<HomeScreen> {
  final courseTextController = TextEditingController();

  final pageController = NotchBottomBarController(index: 0);

  final FocusNode searchFocusNode = FocusNode();
  bool showSearchResults = false;

  void pageChange(int page) {
    setState(() {
      pageController.index = page;
    });
  }

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      setState(() {
        showSearchResults = searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Stack(
        children: [
          IndexedStack(
            index: pageController.index,
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: const Color.fromARGB(255, 3, 102, 184),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      floating: true,
                      snap: true,
                      leading: Builder(
                        builder: (context) {
                          return IconButton(
                            onPressed: () => displayMenuDrawer(context),
                            icon: const Icon(
                              Icons.menu,
                              size: 40,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      actions: [
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Color.fromARGB(255, 236, 190, 4),
                              backgroundImage: AssetImage(
                                'assets/images/fire.png',
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '08',
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 35,
                              color: Color.fromARGB(255, 224, 182, 42),
                            ),
                          ],
                        ),
                        SizedBox(width: size.width*0.18,),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            fixedSize: const Size(110, 20),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Statistics',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => displayNotificationDialog(context),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    weight: 0.2,
                                    color: Colors.blue,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(300),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width:
                                      size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Hi user, Welcome Back!',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      TextFormField(
                                        controller: courseTextController,
                                        focusNode: searchFocusNode,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.search),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Search courses',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const AdCard(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: const ContinueLearningScreen(),
              ),
              const ProfessionalScreen(),
              const LearningScreen(),
            ],
          ),
          if (showSearchResults)
            const SearchResult(),
        ],
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        bottomBarWidth: double.infinity,
        bottomBarHeight: 80,
        color: Colors.blue,
        durationInMilliSeconds: 400,
        showLabel: true,
        notchColor: Colors.blue,
        itemLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        notchBottomBarController: pageController,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.work_outline,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.work_outline,
              color: Colors.white,
            ),
            itemLabel: 'Professional',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.library_books,
              color: Colors.white,
            ),
            activeItem: Icon(
              Icons.library_books,
              color: Colors.white,
            ),
            itemLabel: 'Learning',
          )
        ],
        onTap: pageChange,
        kIconSize: 20,
        kBottomRadius: 10,
      ),
    );
  }
}
