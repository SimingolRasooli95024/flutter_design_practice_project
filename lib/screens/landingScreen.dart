import 'package:design_flutter_app/custom/BorderBox.dart';
import 'package:design_flutter_app/custom/optionButton.dart';
import 'package:design_flutter_app/utils/constants.dart';
import 'package:design_flutter_app/utils/custom_function.dart';
import 'package:design_flutter_app/utils/sample_data.dart';
import 'package:design_flutter_app/utils/widget_function.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final  sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      backgroundColor: COLOR_WHITE,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: padding, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BorderBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        ),
                      ),
                      BorderBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ),
                      )
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: const EdgeInsets.only(right: 350),
                  child: Text(
                    "City",
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  //my code
                  padding: const EdgeInsets.only(right: 230),
                  child: Text(
                    "San Francisco",
                    style: themeData.textTheme.headline1,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    )),
                addVerticalSpace(10),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      "<\$220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                        .map((filter) => ChoicOption(text: filter))
                        .toList(),
                  ),
                ),
                addVerticalSpace(10),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(itemData: RE_DATA[index]);
                        }),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 20,
                width: size.width,
                child: Center(
                  child: OptionButton(
              icon: Icons.map_rounded,
                  text: "Map View",
              width: size.width*0.35,
            ),
                ))
          ],
        )
      ),
    );
  }
}

class ChoicOption extends StatelessWidget {
  final String? text;

  const ChoicOption({Key? key, @required this.text}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: COLOR_GREY.withAlpha(25)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(left: 25),
      //monda
      child: Text(
        text!,style: themeData.textTheme.headline3,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic? itemData;
  const RealEstateItem({Key? key, @required this.itemData}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemData["image"])),
              const Positioned(
                top: 15,
                  right: 15,
                  child: BorderBox(
                    height: 50,
                    width: 50,
                    padding:  EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: COLOR_BLACK,
                    )
                  ))
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                "${formatCurrency(itemData["amount"])}"
                ,style:themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                "${itemData["address"]}",
                style:themeData.textTheme.bodyText2,
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]}"
                " bathrooms / ${itemData["area"]} sqft ",
            style:themeData.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
