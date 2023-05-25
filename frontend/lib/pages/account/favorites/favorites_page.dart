import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

List favoritesList = [
  {
    'title': 'BDA Complex',
    'subtitle': '4517 Washington Ave. Manchester, Kentucky 39495',
  },
  {
    'title': 'Teacher’s Colony',
    'subtitle': '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  },
  {
    'title': 'Jaggasandra',
    'subtitle': '2464 Royal Ln. Mesa, New Jersey 45463',
  },
  {
    'title': 'Lawnfield Parks',
    'subtitle': '6391 Elgin St. Celina, Delaware 10299',
  },
];

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Favorites',
          )),
      body: favoritesList.isEmpty ? emptyData() : filledData(),
    );
  }

  SafeArea emptyData() {
    return SafeArea(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 5.h,
          child: Image.asset(emptyFavorites),
        ),
        heightSpace7,
        Text('No items in favorites', style: color94Regular16)
      ],
    )));
  }

  SingleChildScrollView filledData() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          heightSpace15,
          ...favoritesList.map((e) {
            var index = favoritesList.indexOf(e);
            return Column(
              children: [
                heightSpace5,
                Slidable(
                  key: Key('$e'),
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    extentRatio: 0.10,
                    children: [
                      SlidableAction(
                        onPressed: (BuildContext context) {
                          setState(() {
                            favoritesList.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: primaryColor,
                              duration: const Duration(seconds: 1),
                              content: Text(
                                "${e['title']} removed from favorites",
                                style: whiteRegular16,
                              )));
                        },
                        backgroundColor: const Color(0xffFF0000),
                        padding: const EdgeInsets.only(left: 3),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                    ],
                  ),
                  child: MyContainerWithChild(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e['title'], style: blackMedium16),
                        Text(e['subtitle'],
                            maxLines: 1, style: color94Regular14),
                      ],
                    ),
                  ),
                ),
                heightSpace10,
              ],
            );
          })
        ],
      ),
    );
  }
}
