import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class BookSlotPage extends StatefulWidget {
  const BookSlotPage({Key? key}) : super(key: key);

  @override
  State<BookSlotPage> createState() => _BookSlotPageState();
}

List parkingRateList = [
  {'title': '30 min', 'subtitle': '\$3.00'},
  {'title': '1 hour', 'subtitle': '\$6.00'},
  {'title': '2 hour', 'subtitle': '\$8.00'},
  {'title': '4 hour', 'subtitle': '\$10.00'},
  {'title': '6 hour', 'subtitle': '\$14.00'},
  {'title': '8 hour', 'subtitle': '\$16.00'},
  {'title': '12 hour', 'subtitle': '\$20.00'},
];
List paymentTypeList = [
  {'image': wallet, 'title': 'Wallet'},
  {'image': cash, 'title': 'Pay on Spot'},
  {'image': cC, 'title': 'Credit Card'},
  {'image': pP, 'title': 'Paypal'},
];
List c1SlotList = [
  {'slotId': 'C101', 'available': true},
  {'slotId': 'C102', 'available': true},
  {'slotId': 'C103', 'available': true},
  {'slotId': 'C104', 'available': false},
  {'slotId': 'C105', 'available': false},
  {'slotId': 'C106', 'available': true},
];
List c1HalfSlotList = [
  {'slotId': 'C107', 'available': false},
  {'slotId': 'C108', 'available': true},
  {'slotId': 'C109', 'available': true},
];
List b1SlotList = [
  {'slotId': 'B101', 'available': true},
  {'slotId': 'B102', 'available': false},
  {'slotId': 'B103', 'available': true},
  {'slotId': 'B104', 'available': false},
  {'slotId': 'B105', 'available': true},
  {'slotId': 'B106', 'available': true},
];
List b1HalfSlotList = [
  {'slotId': 'B107', 'available': false},
  {'slotId': 'B108', 'available': false},
  {'slotId': 'B109', 'available': false},
];
List b2SlotList = [
  {'slotId': 'B201', 'available': true},
  {'slotId': 'B202', 'available': true},
  {'slotId': 'B203', 'available': false},
  {'slotId': 'B204', 'available': true},
  {'slotId': 'B205', 'available': false},
  {'slotId': 'B206', 'available': false},
];
List b2HalfSlotList = [
  {'slotId': 'B207', 'available': true},
  {'slotId': 'B208', 'available': true},
  {'slotId': 'B209', 'available': true},
];

class _BookSlotPageState extends State<BookSlotPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  int _selectedDuration = 0;
  int _selectedPaymentMode = 0;
  String _selectedParkingSlot = b1SlotList[0]['slotId'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationMethod(),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Book Slot',
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace22,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Vehicle', style: blackRegular16),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/MyVehiclePage');
                          },
                          child: Text('Change', style: primaryMedium16))
                    ],
                  ),
                  heightSpace7,
                  MyContainerWithChild(
                    padding: const EdgeInsets.fromLTRB(10, 3.5, 0, 3.5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Toyota Matrix', style: blackRegular14),
                              Text('Hatchback | GJ05NC1710',
                                  style: color94Medium12),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: Image.asset(bookSlotCar),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            heightSpace22,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Select Duration', style: blackRegular16),
            ),
            heightSpace7,
            SizedBox(
              height: 55,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                itemCount: parkingRateList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var e = parkingRateList[index];
                  return GestureDetector(
                      onTap: () {
                        setState(() {});
                        _selectedDuration = parkingRateList.indexOf(e);
                      },
                      child: MyContainerWithChild(
                        boxShadow: _selectedDuration == index
                            ? [
                                const BoxShadow(
                                  color: primaryColor,
                                  blurRadius: 5,
                                )
                              ]
                            : [
                                BoxShadow(
                                  color: colorForShadow,
                                  blurRadius: 5,
                                )
                              ],
                        color: _selectedDuration == parkingRateList.indexOf(e)
                            ? primaryColor
                            : white,
                        margin: index == 0
                            ? const EdgeInsets.only(right: 5)
                            : index == parkingRateList.length - 1
                                ? const EdgeInsets.only(left: 5)
                                : const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 20),
                        child: Column(children: [
                          Text(e['title'],
                              style: _selectedDuration == index
                                  ? whiteMedium16
                                  : blackMedium16),
                          Text(e['subtitle'],
                              style: _selectedDuration ==
                                      parkingRateList.indexOf(e)
                                  ? whiteRegular14
                                  : color94Regular14)
                        ]),
                      ));
                },
              ),
            ),
            heightSpace20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Payment Mode', style: blackRegular16),
                  heightSpace7,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: paymentTypeList
                          .map((e) => Expanded(
                                child: MyContainerWithChild(
                                  boxShadow: _selectedPaymentMode ==
                                          paymentTypeList.indexOf(e)
                                      ? [
                                          const BoxShadow(
                                            color: primaryColor,
                                            blurRadius: 5,
                                          )
                                        ]
                                      : [
                                          BoxShadow(
                                            color: colorForShadow,
                                            blurRadius: 5,
                                          )
                                        ],
                                  color: _selectedPaymentMode ==
                                          paymentTypeList.indexOf(e)
                                      ? primaryColor
                                      : white,
                                  onTap: () {
                                    setState(() {});
                                    _selectedPaymentMode =
                                        paymentTypeList.indexOf(e);
                                  },
                                  padding: const EdgeInsets.all(5),
                                  margin: parkingRateList.indexOf(e) == 0
                                      ? const EdgeInsets.only(right: 5)
                                      : parkingRateList.indexOf(e) == 3
                                          ? const EdgeInsets.only(left: 5)
                                          : const EdgeInsets.symmetric(
                                              horizontal: 5),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 3.h,
                                          child: Image.asset(e['image'])),
                                      heightSpace5,
                                      Text(e['title'],
                                          style: _selectedPaymentMode ==
                                                  paymentTypeList.indexOf(e)
                                              ? whiteRegular14
                                              : color94Regular14)
                                    ],
                                  ),
                                ),
                              ))
                          .toList()),
                  heightSpace20,
                  _selectedPaymentMode == 0
                      ? const SizedBox()
                      : _selectedPaymentMode == 1
                          ? payonSpotMethod()
                          : _selectedPaymentMode == 2
                              ? cardPayment()
                              : PrefixPrimaryTextField(
                                  prefixAsset: email,
                                  hintText: 'Email',
                                ),
                  heightSpace20,
                  Text('Select Parking Slot', style: blackRegular16),
                  heightSpace7,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('C1', style: blackRegular16),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Entry', style: blackRegular16),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('B2', style: blackRegular16),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('B1', style: blackRegular16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ...c1SlotList.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  if (e['available'] == true) {
                                    setState(() {});
                                    _selectedParkingSlot = e['slotId'];
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      color: _selectedParkingSlot == e['slotId']
                                          ? primaryColor
                                          : transparent,
                                      border: const Border(
                                        bottom: BorderSide(color: colorB7),
                                      )),
                                  child: e['available'] == true
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(e['slotId'],
                                              style: _selectedParkingSlot ==
                                                      e['slotId']
                                                  ? whiteRegular14
                                                  : color94Regular14),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(bookedSlot),
                                        ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            heightSpace10,
                            SizedBox(height: 45, child: Image.asset(downArrow)),
                            heightSpace20,
                            const SizedBox(
                              height: 285,
                              child: DottedLine(
                                direction: Axis.vertical,
                                lineThickness: 1.5,
                                dashLength: 28.0,
                                dashColor: Colors.black,
                                dashGapLength: 20.0,
                                dashGapRadius: 0.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ...b2SlotList.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  if (e['available'] == true) {
                                    setState(() {});
                                    _selectedParkingSlot = e['slotId'];
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      color: _selectedParkingSlot == e['slotId']
                                          ? primaryColor
                                          : transparent,
                                      border: const Border(
                                        right: BorderSide(color: colorB7),
                                        bottom: BorderSide(color: colorB7),
                                      )),
                                  child: e['available'] == true
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(e['slotId'],
                                              style: _selectedParkingSlot ==
                                                      e['slotId']
                                                  ? whiteRegular14
                                                  : color94Regular14),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(bookedSlot),
                                        ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ...b1SlotList.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  if (e['available'] == true) {
                                    setState(() {});
                                    _selectedParkingSlot = e['slotId'];
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color: _selectedParkingSlot == e['slotId']
                                          ? primaryColor
                                          : transparent,
                                      border: const Border(
                                        bottom: BorderSide(color: colorB7),
                                      )),
                                  child: e['available'] == true
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(e['slotId'],
                                              style: _selectedParkingSlot ==
                                                      e['slotId']
                                                  ? whiteRegular14
                                                  : color94Regular14),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(bookedSlot),
                                        ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, bottom: 10),
                    child: SizedBox(
                      height: 45,
                      child: Row(children: [
                        SizedBox(width: 55, child: Image.asset(leftArrow)),
                        widthSpace10,
                        Text('Exit', style: blackRegular18),
                        widthSpace10,
                        SizedBox(width: 55, child: Image.asset(rightArrow)),
                      ]),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ...c1HalfSlotList.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  if (e['available'] == true) {
                                    setState(() {});
                                    _selectedParkingSlot = e['slotId'];
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      color: _selectedParkingSlot == e['slotId']
                                          ? primaryColor
                                          : transparent,
                                      border: const Border(
                                        bottom: BorderSide(color: colorB7),
                                      )),
                                  child: e['available'] == true
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(e['slotId'],
                                              style: _selectedParkingSlot ==
                                                      e['slotId']
                                                  ? whiteRegular14
                                                  : color94Regular14),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(bookedSlot),
                                        ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 165,
                              child: DottedLine(
                                direction: Axis.vertical,
                                lineThickness: 1.5,
                                dashLength: 26.0,
                                dashColor: Colors.black,
                                dashGapLength: 20.0,
                                dashGapRadius: 0.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ...b2HalfSlotList.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  if (e['available'] == true) {
                                    setState(() {});
                                    _selectedParkingSlot = e['slotId'];
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      color: _selectedParkingSlot == e['slotId']
                                          ? primaryColor
                                          : transparent,
                                      border: const Border(
                                        right: BorderSide(color: colorB7),
                                        bottom: BorderSide(color: colorB7),
                                      )),
                                  child: e['available'] == true
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(e['slotId'],
                                              style: _selectedParkingSlot ==
                                                      e['slotId']
                                                  ? whiteRegular14
                                                  : color94Regular14),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(bookedSlot),
                                        ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ...b1HalfSlotList.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  if (e['available'] == true) {
                                    setState(() {});
                                    _selectedParkingSlot = e['slotId'];
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color: _selectedParkingSlot == e['slotId']
                                          ? primaryColor
                                          : transparent,
                                      border: const Border(
                                        bottom: BorderSide(color: colorB7),
                                      )),
                                  child: e['available'] == true
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(e['slotId'],
                                              style: _selectedParkingSlot ==
                                                      e['slotId']
                                                  ? whiteRegular14
                                                  : color94Regular14),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(bookedSlot),
                                        ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightSpace30,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text payonSpotMethod() {
    return Text(
        'Pay cash at parking spot,You can also pay online anytime after booking',
        style: color94Regular16);
  }

  Widget bottomNavigationMethod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: PrimaryButton(
            text: _selectedPaymentMode != 1
                ? 'Pay ${parkingRateList[_selectedDuration]['subtitle']}'
                : 'Pay on Spot',
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacementNamed(context, '/BookingSuccessfulPage');
            },
          ),
        )
      ],
    );
  }

  Widget cardPayment() {
    return Column(
      children: [
        CreditCardWidget(
          cardBgColor: primaryColor,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (e) {},
          cardType: CardType.mastercard,
        ),
        CreditCardForm(
          cursorColor: primaryColor,
          formKey: formKey,
          onCreditCardModelChange: onCreditCardModelChange,
          obscureCvv: true,
          obscureNumber: true,
          cardHolderDecoration: InputDecoration(
            labelText: 'Card Holder Name',
            labelStyle: color94Regular16,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          cardNumberDecoration: InputDecoration(
            labelText: 'Card Number',
            hintText: 'XXXX XXXX XXXX XXXX',
            hintStyle: color94Regular16,
            labelStyle: color94Regular16,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          expiryDateDecoration: InputDecoration(
            labelText: 'Valid Thru',
            hintText: 'XX/XX',
            hintStyle: color94Regular16,
            labelStyle: color94Regular16,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          cvvCodeDecoration: InputDecoration(
            labelText: 'CVV',
            hintText: 'XXX',
            hintStyle: color94Regular16,
            labelStyle: color94Regular16,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
            ),
          ),
          cardHolderName: '',
          cardNumber: '',
          cvvCode: '',
          expiryDate: '',
          themeColor: white,
        ),
        heightSpace10,
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
