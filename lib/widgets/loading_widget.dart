import 'package:flutter/material.dart';
import 'package:lectorem/utilities/colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final bool withPhoto;
  final bool withSubtitle;

  const LoadingWidget({this.withPhoto = false, this.withSubtitle = true});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            bool hasPicture = withPhoto &&
                LoadingWidgetPreRandomizedValues.hasPhotoListBool[index];
            int titleWidth = hasPicture
                ? LoadingWidgetPreRandomizedValues.titleWidthListMax128[index]
                : LoadingWidgetPreRandomizedValues.titleWidthListMax256[index];
            int subtitleWidth = hasPicture
                ? LoadingWidgetPreRandomizedValues
                    .subtitleWidthListMax196[index]
                : LoadingWidgetPreRandomizedValues
                    .subtitleWidthListMax320[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  hasPicture
                      ? Shimmer.fromColors(
                          baseColor: CustomColors.lightGrey,
                          highlightColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: CustomColors.lightGrey,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              width: 80.0,
                              height: 60.0,
                            ),
                          ),
                        )
                      : SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Shimmer.fromColors(
                        baseColor: withSubtitle
                            ? CustomColors.mediumGrey
                            : CustomColors.lightGrey,
                        highlightColor: Colors.white,
                        child: Padding(
                          padding: withSubtitle
                              ? const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0)
                              : const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: withSubtitle ? 12.0 : 16.0,
                            width: titleWidth.toDouble(),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: withSubtitle
                                    ? CustomColors.mediumGrey
                                    : CustomColors.lightGrey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      withSubtitle
                          ? Shimmer.fromColors(
                              baseColor: CustomColors.lightGrey,
                              highlightColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: SizedBox(
                                  height: 12.0,
                                  width: subtitleWidth.toDouble(),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: CustomColors.lightGrey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10,
        ),
      ),
    );
  }
}

class LoadingWidgetPreRandomizedValues {
  static const titleWidthListMax128 = [
    85,
    74,
    127,
    71,
    70,
    125,
    68,
    126,
    86,
    122
  ];
  static const titleWidthListMax256 = [
    221,
    163,
    181,
    243,
    168,
    177,
    240,
    154,
    233,
    218
  ];
  static const subtitleWidthListMax196 = [
    140,
    173,
    172,
    154,
    137,
    161,
    167,
    172,
    168,
    172
  ];

  static const subtitleWidthListMax320 = [
    291,
    283,
    312,
    268,
    259,
    274,
    290,
    280,
    306,
    305
  ];

  static const hasPhotoListBool = [
    true,
    false,
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
  ];
}
