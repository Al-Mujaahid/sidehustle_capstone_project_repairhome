// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sidehustle_capstone/model/offer_kind.dart';
import 'package:sidehustle_capstone/utils/colors.dart';
import 'package:sidehustle_capstone/utils/constants.dart';
import 'package:sidehustle_capstone/widgets/widgets.dart';

class ViewOffersDetails extends StatelessWidget {
  ViewOffersDetails({required this.offerKind, Key? key}) : super(key: key);
  OfferKind offerKind;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                    color: liteRed,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    const YSpace(20),
                    SideSpace(
                      10,
                      10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: IconOf(
                                  Icons.arrow_back_ios_rounded, black, 20)),
                          TextOf(offerKind.title!, 17, FontWeight.w700, black),
                          Container()
                        ],
                      ),
                    ),
                    const YSpace(10),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(offerKind.image!),
                    ),
                  ],
                ),
              )),
          SideSpace(
              10,
              10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SizedBox(
                        height: 50,
                        width: 180,
                        child: Container(
                          decoration: BoxDecoration(
                              color: liteRed,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: TextOf(
                                  'Reviews', 17, FontWeight.w700, black)),
                        )),
                  ),
                  InkWell(
                    child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Container(
                          decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Image.asset(chat)),
                        )),
                  ),
                ],
              )),
          const YSpace(10),
          Options(option: 'Repair', amount: '52'),
          Options(option: 'Setup', amount: '12'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Orders(
                order: 'Order repair',
                btnColor: black,
                txtColor: white,
              ),
              Orders(
                order: 'Order  setup',
                btnColor: white,
                txtColor: black,
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class Orders extends StatelessWidget {
  Orders({
    required this.order,
    required this.btnColor,
    required this.txtColor,
    Key? key,
  }) : super(key: key);
  String order;
  Color btnColor;
  Color txtColor;
  @override
  Widget build(BuildContext context) {
    return SideSpace(
      10,
      10,
      InkWell(
        child: SizedBox(
            height: 50,
            width: 100,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: liteAsh),
                  color: btnColor,
                  borderRadius: BorderRadius.circular(10)),
              child:
                  Center(child: TextOf(order, 12, FontWeight.w700, txtColor)),
            )),
      ),
    );
  }
}

class Options extends StatelessWidget {
  Options({
    required this.option,
    required this.amount,
    Key? key,
  }) : super(key: key);
  String option;
  String amount;
  @override
  Widget build(BuildContext context) {
    return SideSpace(
      10,
      10,
      SizedBox(
          height: 50,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: liteAsh),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: SideSpace(
              15,
              0,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextOf(option, 12, FontWeight.w700, black),
                  TextOf('\$$amount', 12, FontWeight.w700, black)
                ],
              ),
            ),
          )),
    );
  }
}
