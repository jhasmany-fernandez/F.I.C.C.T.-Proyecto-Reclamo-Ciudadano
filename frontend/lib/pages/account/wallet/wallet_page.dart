import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

List historyList = [
  {
    'title': 'Paid for parking',
    'subtitle': 'Lawnfield parks',
    'isDeposite': false,
    'rate': 3.00,
    'date': '17 Oct, 11:30 am',
  },
  {
    'title': 'Added to wallet',
    'subtitle': 'Bank of Baroda',
    'isDeposite': true,
    'rate': 45.00,
    'date': '16 Oct, 10:12 am',
  },
  {
    'title': 'Added to wallet',
    'subtitle': 'Bank of USA',
    'isDeposite': true,
    'rate': 4.00,
    'date': '16 Oct, 10:00 am',
  },
  {
    'title': 'BDA Complex',
    'subtitle': 'Lawnfield parks',
    'isDeposite': false,
    'rate': 4.00,
    'date': '15 Oct, 11:30 am',
  },
  {
    'title': 'Teacher’s Colony',
    'subtitle': 'Lawnfield parks',
    'isDeposite': false,
    'rate': 3.50,
    'date': '14 Oct, 10:30 am',
  },
];

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Wallet',
          )),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          heightSpace20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Available Balance:',
                  style: color94Regular16,
                  textAlign: TextAlign.center,
                ),
                heightSpace5,
                Text(
                  '\$199.25',
                  style: primaryMedium20,
                  textAlign: TextAlign.center,
                ),
                heightSpace20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.w,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 1.7.h, child: Image.asset(downBal)),
                          widthSpace5,
                          Text('Add Money', style: whiteMedium16),
                        ],
                      ),
                    ),
                    widthSpace20,
                    Container(
                      width: 30.w,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 1.7.h, child: Image.asset(upBal)),
                          widthSpace5,
                          Text('To Bank', style: whiteMedium16),
                        ],
                      ),
                    )
                  ],
                ),
                heightSpace20,
                const Divider(color: colorE6),
                heightSpace15,
                Row(
                  children: [
                    Text('Transaction History', style: blackMedium18),
                  ],
                ),
              ],
            ),
          ),
          // heightSpace10,
          historyList.isEmpty ? emptyData() : filledData()
        ],
      ),
    );
  }

  emptyData() {
    return Column(
      children: [
        SizedBox(
          // color: red,
          height: 50.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 4.5.h,
                child: Image.asset(emptyHistory),
              ),
              heightSpace10,
              Text('No record found', style: color94Regular16)
            ],
          ),
        ),
      ],
    );
  }

  filledData() {
    return Column(children: [
      ...historyList.map((e) {
        var index = historyList.indexOf(e);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Dismissible(
            key: Key('$e'),
            background: Container(color: red),
            onDismissed: (direction) {
              setState(() {
                historyList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: primaryColor,
                  duration: const Duration(seconds: 1),
                  content: Text(
                    "Removed from transaction history",
                    style: whiteRegular16,
                  )));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e['title'], style: blackRegular16),
                      Text(e['subtitle'], style: color94Regular12),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$${e['rate']}0',
                          style: e['isDeposite'] == true
                              ? greenRegular16
                              : redRegular16),
                      Text(e['date'], style: color94Regular12),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      })
    ]);
  }
}
