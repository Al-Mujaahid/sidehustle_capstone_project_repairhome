// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:sidehustle_capstone/model/offer_kind.dart';
import 'package:sidehustle_capstone/utils/colors.dart';
import 'package:sidehustle_capstone/utils/constants.dart';
import 'package:sidehustle_capstone/widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String? setName;
  Widget description() {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(color: white),
        child: Column(
          children: [
            Setup(title: 'Set up Microwave', amount: '\$22'),
            const YSpace(4),
            Setup(title: 'Repair Microwave', amount: '\$80'),
          ],
        ),
      ),
    );
  }

  List<OfferKind> allOffers = [
    OfferKind(
        position: 0,
        title: 'Fix Microwave',
        subtitle: 'Kitchen',
        icon: microwave,
        image: fixMicrowave),
    OfferKind(
        position: 1,
        title: 'Fix TV set',
        subtitle: 'Living room',
        icon: tv,
        image: tv),
    OfferKind(
        position: 2,
        title: 'Fix Fridge',
        subtitle: '2 Service',
        icon: fridge,
        image: fridge),
    OfferKind(
        position: 3,
        title: 'Fix Washer',
        subtitle: '1 Service',
        icon: washer,
        image: washer),
    OfferKind(
        position: 4,
        title: 'Fix Computer',
        subtitle: '1 Service',
        icon: computer,
        image: computer),
  ];

  num position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: liteWhite,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const YSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: IconOf(Icons.arrow_back_ios_rounded, black, 20)),
                  TextOf('Cart', 17, FontWeight.w700, black),
                  Container()
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: allOffers.length,
                  itemBuilder: (BuildContext context, int index) {
                    OfferKind offers = allOffers[index];
                    return Expanded(
                      child: SideSpace(
                        20,
                        0,
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print(offers.position);
                                setState(() {
                                  position = offers.position!;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: liteBlue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    SideSpace(
                                      10,
                                      7,
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: dBlue,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: SideSpace(7, 7,
                                                Image.asset(offers.icon!)),
                                          ),
                                          const XSpace(20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextOf(offers.title!, 13,
                                                  FontWeight.w800, black),
                                              TextOf(offers.subtitle!, 10,
                                                  FontWeight.w800, ash),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          IconOf(
                                              Icons.arrow_forward_ios_rounded,
                                              black,
                                              20)
                                        ],
                                      ),
                                    ),
                                    offers.position == position
                                        ? description()
                                        : Container()
                                  ],
                                ),
                              ),
                            ),
                            const YSpace(10)
                          ],
                        ),
                      ),
                    );
                  }),
              const YSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextOf('Total price', 15, FontWeight.w900, ash),
                  TextOf('\$302', 15, FontWeight.w900, black)
                ],
              ),
              const YSpace(4),
              SideSpace(
                20,
                20,
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          color: black,
                          borderRadius: BorderRadius.circular(10)),
                      child: SideSpace(
                        15,
                        0,
                        Center(
                          child: TextOf(
                              'Make an order', 15, FontWeight.w800, white),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}

class Setup extends StatelessWidget {
  Setup({
    required this.title,
    required this.amount,
    Key? key,
  }) : super(key: key);
  String title;
  String amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: litePurple),
      child: SideSpace(
        20,
        20,
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: red, borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: IconOf(Icons.horizontal_rule_rounded, white, 20)),
            ),
            const XSpace(20),
            TextOf(title, 15, FontWeight.w600, black),
            Expanded(child: Container()),
            TextOf(amount, 15, FontWeight.w600, black)
          ],
        ),
      ),
    );
  }
}
