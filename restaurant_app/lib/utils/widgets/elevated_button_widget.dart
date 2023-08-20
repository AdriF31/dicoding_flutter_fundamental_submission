import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:restaurant_app/utils/theme/color.dart';
import 'package:restaurant_app/utils/theme/text_style.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function? onPressed;
  final Color? buttonColor;
  final Color? loadingButtonColor;
  final double? buttonHeight;
  final TextStyle buttonTextStyle;
  final TextStyle buttonDisableTextStyle;
  final double? buttonWidth;
  final Widget? widget;
  final double? borderRadius;
  final OutlinedBorder? shape;
  final bool? isLoading;
  final double? isLoadingSize;
  final Color? isLoadingColor;
  final double elevation;
  final bool? isLogin;
  final bool? fitWidth;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  const ElevatedButtonWidget(
      {Key? key,
        required this.buttonText,
        this.buttonTextStyle = text16W400,
        this.buttonDisableTextStyle = text16W400,
        this.onPressed,
        this.buttonColor,
        this.loadingButtonColor,
        this.buttonHeight,
        this.buttonWidth,
        this.widget,
        this.borderRadius = 8,
        this.shape,
        this.isLoading = false,
        this.isLoadingSize = 20,
        this.isLoadingColor = Colors.white,
        this.elevation = 1,
        this.isLogin = false,
        this.fitWidth = false,
        this.margin,
        this.padding,
        this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double additionalPadding =
    buttonWidth == null ? MediaQuery.of(context).padding.bottom / 4 : 0;

    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      height: buttonHeight == null ? 48 + additionalPadding : buttonHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          border: borderColor != null
              ? Border.all(width: 1, color: borderColor ?? Colors.grey)
              : null),
      width: fitWidth == null || fitWidth == false
          ? MediaQuery.of(context).size.width
          : null,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(loadingButtonColor != null
              ? loadingButtonColor!
              : onPressed == null
              ? Colors.grey
              : buttonColor == null
              ? primary
              : buttonColor!),
          elevation: MaterialStateProperty.all<double>(
              onPressed == null ? 0 : elevation),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            shape != null
                ? shape!
                : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
        ),
        // disabledColor: tertiary300,
        // elevation: elevation,
        onPressed: onPressed == null ? null : onPressed as void Function()?,
        // color: buttonColor == null ? primary600 : buttonColor,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading!
                  ? Container(
                margin: const EdgeInsets.only(right: 10),
                child: isLogin!
                    ? SpinKitThreeBounce(
                  color: isLoadingColor!,
                  size: isLoadingSize!,
                )
                    : SpinKitRing(
                  lineWidth: 2,
                  color: onPressed == null &&
                      loadingButtonColor == null
                      ? Colors.grey
                      : isLoadingColor!,
                  size: isLoadingSize!,
                ),
              )
                  : Container(),
              isLoading! && isLogin!
                  ? Container()
                  : Text(
                buttonText,
                style: onPressed == null
                    ? buttonDisableTextStyle
                    : buttonTextStyle,
              ),
              widget != null
                  ? Row(
                children: [
                  const SizedBox(height: 2,),
                  widget!,
                ],
              )
                  : Container()
            ],
          ),
        ),
        // shape: shape != null
        //     ? shape
        //     : RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(borderRadius!),
        //       ),
      ),
    );
  }
}
