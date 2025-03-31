import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_cask/blocs/lIstscreen/list_screen_cubit.dart';
import 'package:one_cask/blocs/lIstscreen/list_screen_state.dart';
import 'package:one_cask/screens/detail_screen.dart';
import 'package:one_cask/styles/app_color.dart';
import 'package:one_cask/styles/ebgaramond.dart';

// --- Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WhiskyCubit()..loadWhiskies(),
      child: Scaffold(
        backgroundColor: AppColor.cardBg,
        appBar: AppBar(
          title: Text(
            'My collection',
          ),
          titleTextStyle: ebGaramondTitleStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.w500),
          centerTitle: false,
          leadingWidth: 0,
          backgroundColor: AppColor.primaryBg,
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none_sharp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Handle notification tap
                  },
                ),
                Positioned(
                  right: 12,
                  bottom: 12,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 8,
                      minHeight: 8,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        body: Container(
          color: AppColor.primaryBg,
          child: BlocBuilder<WhiskyCubit, WhiskyState>(
            builder: (context, state) {
              return GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.5, // Adjust for rectangular items
                ),
                itemCount: state.whiskies.length,
                itemBuilder: (context, index) {
                  final whisky = state.whiskies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WhiskyDetailsScreen(
                              whisky: whisky), // Pass the Whisky object
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.cardBg, // Dark background
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              // Make image take 70% of height
                              flex: 7, // 80%
                              child: Center(
                                child: Image.asset(
                                  whisky.imageUrl,
                                  fit: BoxFit.cover, // Adjust fit as needed
                                ),
                              ),
                            ),
                            Expanded(
                              // Make text take 30% of height
                              flex: 3, // 20%
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          whisky.name,
                                          style: ebGaramondTitleStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${whisky.year} ${whisky.number}',
                                          style: ebGaramondTitleStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          whisky.quantity,
                                          style: ebGaramondTitleStyle(
                                              fontSize: 12, color: Colors.grey),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: 1,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/ic_scan.svg'),
                label: 'Scan',
                backgroundColor: AppColor.primaryBg),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/ic_collection.svg'),
                label: 'Collection',
                backgroundColor: AppColor.primaryBg),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/ic_bottle.svg'),
                label: 'Shop',
                backgroundColor: AppColor.primaryBg),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/ic_setting.svg'),
                label: 'Settings',
                backgroundColor: AppColor.primaryBg),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
