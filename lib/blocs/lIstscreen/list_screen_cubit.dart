// --- Cubit ---
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/blocs/lIstscreen/list_screen_state.dart';
import 'package:one_cask/model/whisky_model.dart';

class WhiskyCubit extends Cubit<WhiskyState> {
  WhiskyCubit() : super(WhiskyState(whiskies: []));

  void loadWhiskies() {
    // Simulate loading data from JSON (replace with your actual data fetching)
    String jsonData = '''
      [
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        },
        {
          "name": "Springbank",
          "year": "1992",
          "number": "#1234",
          "imageUrl": "assets/whisky1.png",
          "quantity": "(112/158)",
          "details": {
            "name": "Talisker 18 Year old",
            "year": "18 Year old",
            "number": "#2504",
            "imageUrl": "assets/whisky1.png",
            "quantity": "Bottle 135/184",
            "distillery": "Talisker",
            "region": "Isle of Skye",
            "country": "Scotland",
            "type": "Single Malt",
            "ageStatement": "18 Years",
            "filled": "2005",
            "bottled": "2023",
            "caskNumber": "12345",
            "abv": "45.8%",
            "size": "70cl",
            "finish": "Oak Cask"
          }
        }
      ]
    ''';

    List<dynamic> decodedJson = jsonDecode(jsonData);
    List<Whisky> whiskyList =
        decodedJson.map((json) => Whisky.fromJson(json)).toList();

    emit(state.copyWith(whiskies: whiskyList));
  }

  void selectWhisky(Whisky whisky) {
    emit(state.copyWith(selectedWhisky: whisky));
  }
}