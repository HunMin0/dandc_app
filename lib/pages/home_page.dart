import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_sample/components/setting_colors.dart';
import 'package:theme_sample/pages/add/add_page.dart';
import 'package:theme_sample/pages/history/history_page.dart';
import 'package:theme_sample/pages/today/today_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final _pages = [
    const TodayPage(),
    const HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false, // safearea까지 먹힌 색을 top은 미적용 처리
        child: Scaffold(
          appBar: AppBar(),
          body: _pages[_currentIndex],

          floatingActionButton: FloatingActionButton(
            onPressed: _onAddMedicien,
            child: const Icon(CupertinoIcons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // floatingAction위치

          bottomNavigationBar: _buildBottomAppBar(),
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      elevation: 0, // 바텀바 밑으로 그림자 처리제거
      child: Container(
        color: Colors.white,
        height: kBottomNavigationBarHeight, // material앱에 기본설정으로 잡혀있는 바텀높이
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CupertinoButton(
              onPressed: () => _onCurrentPage(0),
              child: Icon(
                CupertinoIcons.check_mark,
                color: _currentIndex == 0 ? SettingColors.primaryColor : Colors.grey[350], // 활성화시 아이콘 색상변화
              ),
            ),
            CupertinoButton(
              onPressed: () => _onCurrentPage(1),
              child: Icon(
                CupertinoIcons.text_badge_checkmark,
                color: _currentIndex == 1 ? SettingColors.primaryColor : Colors.grey[350], // 활성화시 아이콘 색상변화
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCurrentPage(int pageIndex){
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  void _onAddMedicien(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
  }
}
