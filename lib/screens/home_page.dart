// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidehustle_capstone/model/offer_kind.dart';
import 'package:sidehustle_capstone/screens/cart_screen.dart';
import 'package:sidehustle_capstone/screens/view_offers_detail.dart';
import 'package:sidehustle_capstone/utils/colors.dart';
import 'package:sidehustle_capstone/utils/constants.dart';
import 'package:sidehustle_capstone/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<OfferKind> offersList = [
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
        image: set),
  ];
  int index = 0;
  Widget? offerDesc;
  Widget offers(offer, currentIndex, list) {
    currentIndex == index
        ? offerDesc = list ??
            Column(
              children: [
                const YSpace(20),
                TextOf('No $offer offers available', 15, FontWeight.w700, black)
              ],
            )
        : TextOf('Opps, $offer not found', 30, FontWeight.w300, black);
    return InkWell(
      child: currentIndex == index
          ? Container(
              decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: black)),
              child: SideSpace(5, 2, TextOf(offer, 17, FontWeight.w600, white)),
            )
          : TextOf(offer, 17, FontWeight.w600, ash),
      onTap: () {
        setState(() {
          index = currentIndex;
        });
      },
    );
  }

  Widget lists() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: offersList.length,
      itemBuilder: (BuildContext context, int index) {
        OfferKind allOffers = offersList[index];
        return Expanded(
          child: SideSpace(
            20,
            0,
            Column(
              children: [
                InkWell(
                  onTap: () {
                    goto(context, ViewOffersDetails(offerKind: allOffers));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: liteBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: SideSpace(
                      10,
                      7,
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: dBlue,
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                SideSpace(7, 7, Image.asset(allOffers.icon!)),
                          ),
                          const XSpace(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextOf(
                                  allOffers.title!, 13, FontWeight.w800, black),
                              TextOf(allOffers.subtitle!, 10, FontWeight.w800,
                                  ash),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconOf(Icons.arrow_forward_ios_rounded, black, 20)
                        ],
                      ),
                    ),
                  ),
                ),
                const YSpace(10)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: liteWhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const YSpace(30),
              SideSpace(
                20,
                0,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconOf(Icons.sort_rounded, black, 30),
                    InkWell(
                        onTap: () {
                          goto(context, CartScreen());
                        },
                        child: Image.asset(cart))
                  ],
                ),
              ),
              const YSpace(20),
              SideSpace(
                20,
                0,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextOf("What's broken?", 17, FontWeight.w800, black)
                  ],
                ),
              ),
              const YSpace(20),
              SideSpace(
                20,
                0,
                SizedBox(
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Image.asset(suffix),
                          suffixStyle: const TextStyle(fontSize: 20),
                          hintText: 'Search appliances',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: ash),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: liteWhite, width: 0))),
                    ),
                  ),
                ),
              ),
              const YSpace(20),
              SideSpace(
                20,
                0,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [TextOf('Offers', 15, FontWeight.w800, black)],
                ),
              ),
              const YSpace(16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ScrollingOffer(
                      assetName: attract,
                      description:
                          'We are back with 5% \ndiscount on each\n transaction',
                      title: 'Valid until June 30th',
                      titleColor: liteBlue,
                      descriptionColor: white,
                      imgHeight: 80,
                    ),
                    ScrollingOffer(
                      assetName: set,
                      description: 'Sale on\nappliances\nrepair!',
                      title: 'Valid until July 30th',
                      titleColor: liteWhite,
                      descriptionColor: litePurple,
                      imgHeight: 80,
                    )
                  ],
                ),
              ),
              const YSpace(20),
              SideSpace(
                20,
                0,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [TextOf('We can fix', 15, FontWeight.w800, black)],
                ),
              ),
              const YSpace(10),
              SideSpace(
                  10,
                  0,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        offers('Offers', 0, lists()),
                        const XSpace(10),
                        offers('Kitchen', 1, null),
                        const XSpace(10),
                        offers('Livingroom', 2, null),
                        const XSpace(10),
                        offers('Bathroom', 3, null),
                        const XSpace(10),
                        offers('Compound', 4, null),
                      ],
                    ),
                  )),
              offerDesc!
            ],
          ),
        ));
  }
}

class ScrollingOffer extends StatelessWidget {
  ScrollingOffer({
    required this.assetName,
    required this.description,
    required this.title,
    required this.titleColor,
    required this.descriptionColor,
    required this.imgHeight,
    Key? key,
  }) : super(key: key);
  String title;
  String description;
  String assetName;
  Color titleColor;
  Color descriptionColor;
  double imgHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: 259,
      child: Card(
        elevation: 5,
        color: descriptionColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                    color: titleColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                  child: TextOfDecoration(
                      title, 20, FontWeight.w700, black, TextAlign.left),
                ),
              ),
            ),
            const YSpace(20),
            SideSpace(
              10,
              10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const XSpace(10),
                          TextOfDecoration(description, 20, FontWeight.w600,
                              black, TextAlign.left),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: imgHeight,
                    child: Image.asset(assetName),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
