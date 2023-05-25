import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constant.dart';
import '../../../utils/widgets.dart';

class ExtendTimePage extends StatefulWidget {
  const ExtendTimePage({Key? key}) : super(key: key);

  @override
  State<ExtendTimePage> createState() => _ExtendTimePageState();
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

class _ExtendTimePageState extends State<ExtendTimePage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  int _selectedDuration = 0;
  int _selectedPaymentMode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Add Time',
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
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
                  heightSpace30,
                  PrimaryButton(
                    text: _selectedPaymentMode != 1
                        ? 'Pay ${parkingRateList[_selectedDuration]['subtitle']}'
                        : 'Pay on Spot',
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacementNamed(
                          context, '/ExtendTimeSuccessfulPage');
                    },
                  ),
                  heightSpace30
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
