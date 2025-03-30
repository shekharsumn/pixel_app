import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/styles/app_color.dart';
import 'package:one_cask/styles/ebgaramond.dart';

// --- Data Model ---
class Whisky {
  final String name;
  final String year;
  final String number;
  final String imageUrl;
  final String quantity;

  Whisky({
    required this.name,
    required this.year,
    required this.number,
    required this.imageUrl,
    required this.quantity,
  });
}

// --- Cubit State ---
class WhiskyState {
  final List<Whisky> whiskies;

  WhiskyState({required this.whiskies});

  WhiskyState copyWith({List<Whisky>? whiskies}) {
    return WhiskyState(whiskies: whiskies ?? this.whiskies);
  }
}

// --- Cubit ---
class WhiskyCubit extends Cubit<WhiskyState> {
  WhiskyCubit() : super(WhiskyState(whiskies: []));

  void loadWhiskies() {
    // Simulate loading data (replace with your actual data fetching)
    emit(state.copyWith(whiskies: [
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
      Whisky(
        name: 'Springbank',
        year: '1992',
        number: '#1234',
        imageUrl: 'assets/whisky1.png', // Replace with your image path
        quantity: '(112/158)',
      ),
    ]));
  }
}

// --- Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WhiskyCubit()..loadWhiskies(),
      child: Scaffold(
        backgroundColor: AppColor.card_bg,
        appBar: AppBar(
          title: Text(
            'My collection',
          ),
          titleTextStyle: ebGaramondTitleStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.w500),
          centerTitle: false,
          leadingWidth: 0,
          backgroundColor: AppColor.primary_bg,
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
          color: AppColor.primary_bg,
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
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColor.card_bg, // Dark background
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
                                            fontSize: 22, color: Colors.white),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${whisky.year} ${whisky.number}',
                                        style: ebGaramondTitleStyle(
                                            fontSize: 22, color: Colors.white),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        whisky.quantity,
                                        style:
                                            ebGaramondTitleStyle(
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
                  );
                },
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: 1,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.crop_free),
                label: 'Scan',
                backgroundColor: AppColor.primary_bg),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: 'Collection',
                backgroundColor: AppColor.primary_bg),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Shop',
                backgroundColor: AppColor.primary_bg),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: AppColor.primary_bg),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
