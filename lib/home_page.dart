import 'package:flutter/material.dart';
import 'package:landf/src/chat/home_chat_page.dart';
import 'package:landf/src/chat/notification_service.dart';
import 'package:landf/src/pages/found_objet_page.dart';
import 'package:landf/src/pages/lost_objet_page.dart';
import 'package:landf/src/pages/search_page.dart';
import 'package:landf/src/pages/user_page.dart';
import 'package:landf/src/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentPage = 0;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotificationService.initialize();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.pink,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end:  FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          splashColor: AppColors.primary,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeChtaPage()));
          },
          icon: Icon(
            Icons.message,
            color: AppColors.hexToColor("ffffff"),
          ),
        ),
        title: const Text(
          "DTechtive Doc",
          style: TextStyle(
            color: AppColors.primaryGrayText,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            splashColor: AppColors.secondary,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: Icon(
              Icons.search,
              color: AppColors.hexToColor("ffffff"),
            ),
          ),
          IconButton(
            splashColor: AppColors.secondary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfilePage(),
                ),
              );
            },
            icon: Icon(
              Icons.person,
              color: AppColors.hexToColor("ffffff"),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.primary,
            unselectedLabelColor: AppColors.grayScale,
            labelColor: AppColors.primary,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            controller: _tabController,
            tabs: const [
              Tab(
                text: "LOST OBJECT",
              ),
              Tab(
                text: "FOUND OBJECT",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LostObjePage(),
                FoundObjetPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
