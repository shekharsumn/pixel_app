import 'package:flutter/material.dart';
import 'package:one_cask/model/whisky_model.dart';
import 'package:one_cask/styles/app_color.dart';
import 'package:one_cask/styles/ebgaramond.dart';
import 'package:one_cask/widgets/genuine_widget.dart';

class WhiskyDetailsScreen extends StatefulWidget {
  final Whisky whisky;

  const WhiskyDetailsScreen({required this.whisky, super.key});

  @override
  WhiskyDetailsScreenState createState() => WhiskyDetailsScreenState();
}

class WhiskyDetailsScreenState extends State<WhiskyDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBg,
      appBar: AppBar(
        title: Row(
          children: [
            Text('Genesis Collection'),
          ],
        ),
        leadingWidth: 0,
        titleTextStyle: ebGaramondTitleStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        centerTitle: false,
        backgroundColor: AppColor.primaryBg,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.primary,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/splash_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GenuineBottleWidget(),
                    SizedBox(
                      height: 450,
                      child: Center(
                        child: Image.asset(
                          'assets/whisky1.png',
                          fit: BoxFit.cover, // Adjust fit as needed
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      color: AppColor.cardBg,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.whisky.details['quantity'],
                                style: ebGaramondTitleStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.whisky.details['name'],
                                style: ebGaramondTitleStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.whisky.details['number'],
                                style: ebGaramondTitleStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: AppColor.primaryBg,
                              child: TabBar(
                                controller: _tabController,
                                dividerColor: Colors.transparent,
                                tabs: [
                                  Tab(text: 'Details'),
                                  Tab(text: 'Tasting notes'),
                                  Tab(text: 'History'),
                                ],
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                indicator: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorPadding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 6.0),
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 450,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _buildDetailsTab(widget.whisky),
                                Center(
                                    child: Text(
                                  'Tasting Notes Feature Coming Soon!!!',
                                  style: ebGaramondTitleStyle(
                                      fontSize: 18, color: Colors.white),
                                )),
                                Center(
                                    child: Text(
                                        'History Feature Coming Soon!!!',
                                        style: ebGaramondTitleStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Add to collection logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize: const Size(70, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        '+ Add to my collection',
                        style: ebGaramondTitleStyle(
                            fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsTab(Whisky whisky) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          _buildDetailRow('Distillery', whisky.details['distillery']),
          _buildDetailRow('Region', whisky.details['region']),
          _buildDetailRow('Country', whisky.details['country']),
          _buildDetailRow('Type', whisky.details['type']),
          _buildDetailRow('Age statement', whisky.details['ageStatement']),
          _buildDetailRow('Filled', whisky.details['filled']),
          _buildDetailRow('Bottled', whisky.details['bottled']),
          _buildDetailRow('Cask number', whisky.details['caskNumber']),
          _buildDetailRow('ABV', whisky.details['abv']),
          _buildDetailRow('Size', whisky.details['size']),
          _buildDetailRow('Finish', whisky.details['finish']),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: ebGaramondTitleStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            value,
            style: ebGaramondTitleStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
