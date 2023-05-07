import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raam_dhulaai/src/core/theme/app_colors.dart';
import 'package:raam_dhulaai/src/core/theme/app_styles.dart';

class CustomSearchServices extends SearchDelegate {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List suggestionData = [];
  Timer? _debounce;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      InkWell(
        onTap: () {
          query = '';
        },
        child: Center(
          child: Icon(
            Icons.clear,
            color: Colors.grey,
          ),
        ),
      ),
      SizedBox(
        width: 15,
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Search Suggestion',
              textAlign: TextAlign.start,
              style: AppStyles.text20PxSemiBold,
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: List.generate(suggestionData.length, (index) {
                return InkWell(
                  onTap: () {
                    // Navigation.changeScreen(
                    //     context,
                    //     CookingScreen(
                    //       snapshot: suggestionData[index],
                    //     ));
                  },

                  /// TODO: suggestions dynamic
                  child: SuggestionChip(
                    foodName: 'Name',
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('build suggestion called');
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    /// Debouncing implemented to prevent app from calling firebase
    /// for ever single letter search

    _debounce = Timer(const Duration(milliseconds: 100), () {
      /// now app will call getSuggestionFromFirebase() after 500ms of user typing
      getSuggestionFromFirebase();
    });
    return ListView.builder(
        itemCount: suggestionData.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    // Navigation.changeScreen(
                    //     context,
                    //     CookingScreen(
                    //       snapshot: suggestionData[index],
                    //     ));
                  },
                  child: Text(
                    suggestionData[index]['name'].toString(),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });

    // throw UnimplementedError();
  }

  Future getSuggestionFromFirebase() async {
    print('firebase called');
    var documentCollection = await fireStore.collection('products').get();
    suggestionData = documentCollection.docs.where((element) {
      if (element['name'].toString().toLowerCase().trim().contains(query)) {
        return true;
      } else
        return false;
    }).toList();
  }
}

class SuggestionChip extends StatelessWidget {
  final String foodName;

  SuggestionChip({this.foodName = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.5), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        foodName,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
