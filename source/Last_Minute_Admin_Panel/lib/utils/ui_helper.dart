
import 'package:flutter/material.dart';

import 'dimensions.dart';


class UIHelper {
  static final double _verticalSpaceExtraSmall = Dimensions.height20/5;
  static final double _verticalSpaceSmall = Dimensions.height10*0.8;
  static final double _verticalSpaceMedium = Dimensions.height10*1.6;
  static final double _verticalSpaceLarge = Dimensions.height10*2.4;
  static final double _verticalSpaceExtraLarge = Dimensions.height10*4.8;

  static final double _horizontalSpaceExtraSmall = Dimensions.height20/5;
  static final double _horizontalSpaceSmall = Dimensions.height10*0.8;
  static final double _horizontalSpaceMedium = Dimensions.height10*1.6;
  static final double _horizontalSpaceLarge = Dimensions.height10*2.4;
  static final double _horizontalSpaceExtraLarge = Dimensions.height10*4.8;

  static SizedBox verticalSpaceExtraSmall() =>
      verticalSpace(_verticalSpaceExtraSmall);
  static SizedBox verticalSpaceSmall() => verticalSpace(_verticalSpaceSmall);
  static SizedBox verticalSpaceMedium() => verticalSpace(_verticalSpaceMedium);
  static SizedBox verticalSpaceLarge() => verticalSpace(_verticalSpaceLarge);
  static SizedBox verticalSpaceExtraLarge() =>
      verticalSpace(_verticalSpaceExtraLarge);

  static SizedBox verticalSpace(double height) => SizedBox(height: height);

  static SizedBox horizontalSpaceExtraSmall() =>
      horizontalSpace(_horizontalSpaceExtraSmall);
  static SizedBox horizontalSpaceSmall() =>
      horizontalSpace(_horizontalSpaceSmall);
  static SizedBox horizontalSpaceMedium() =>
      horizontalSpace(_horizontalSpaceMedium);
  static SizedBox horizontalSpaceLarge() =>
      horizontalSpace(_horizontalSpaceLarge);
  static SizedBox horizontalSpaceExtraLarge() =>
      horizontalSpace(_horizontalSpaceExtraLarge);

  static SizedBox horizontalSpace(double width) => SizedBox(width: width);
}
