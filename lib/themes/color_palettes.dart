import 'package:flutter/material.dart';

class ColorPalettes {
  static Color pPurple = hexToColor('#6B15D3');
  static Color pBlue = hexToColor('#6E4CF8');
  static List<Color> pGradient = [
    hexToColor('#553ADE'),
    hexToColor('#7357FF'),
  ];
  static List<Color> gradientYellow = [
    hexToColor('#F09819'),
    hexToColor('#EDDE5D'),
  ];
  static List<Color> sliderGradients = [
    hexToColor('#01B16F'),
    hexToColor('#21986B'),
    hexToColor('#0CD68A'),
  ];
  static List<Color> imageGradients = [
    hexToColor('#070717').withOpacity(0.6),
    hexToColor('#000000 '),
    // hexToColor('#070717'),
  ];

  static Gradient gradientColor({
    List<Color>? colors,
    begin = Alignment.centerLeft,
    end = Alignment.centerRight,
  }) {
    return LinearGradient(
      colors: colors ?? ColorPalettes.pGradient,
      begin: begin,
      end: end,
    );
  }

  static List<Color> pDarkGradient = [
    ColorPalettes.sDarkPurple,
    ColorPalettes.sDarkBlue,
  ];
  static Gradient darkGradientHorizontal = LinearGradient(
    colors: ColorPalettes.pDarkGradient,
  );
  static Gradient darkGradientVertical = LinearGradient(
    colors: ColorPalettes.pDarkGradient,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Gradient imageGradient = LinearGradient(
    colors: ColorPalettes.imageGradients,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color sSupportPurple = hexToColor('#F1E8FD');
  static Color sSupportPurple2 = hexToColor('#F2EDF7');
  static Color sLightPurple = hexToColor('#AF7DE7');
  static Color sDarkPurple = hexToColor('#540EA7');
  static Color sDarkBlue = hexToColor('#5437C0');

  static Color nBlack = hexToColor('#1F2433');

  static Color black4 = hexToColor('#0000000a');
  static Color black7 = hexToColor('#00000012');
  static Color black12 = hexToColor('#00000003');
  static Color black16 = hexToColor('#00000004');
  static Color black20 = hexToColor('#00000033');
  static Color black24 = hexToColor('#0000003d');
  static Color black32 = hexToColor('#00000052');
  static Color black48 = hexToColor('#0000007a');
  static Color black64 = hexToColor('#000000a3');
  static Color black76 = hexToColor('#000000c2');
  static Color black88 = hexToColor('#000000e0');
  static Color black100 = hexToColor('#000000');

  static Color nWhite = hexToColor('#FFFFFF');
  static Color nBackground = hexToColor('#F9F9FF');
  static Color nBackground2 = hexToColor('#EFEFF5');
  static Color nDisable = hexToColor('#B2B4BF');
  static Color wireframe = hexToColor('#2D3648');

  static Color primary25 = hexToColor('#F9F8FF');
  static Color primary50 = hexToColor('#F1EEFF');
  static Color primary75 = hexToColor('#E2DCFF');
  static Color primary100 = hexToColor('#C6BBFF');
  static Color primary200 = hexToColor('#BCAFFF');
  static Color primary300 = hexToColor('#A797FF');
  static Color primary400 = hexToColor('#8B75FF');
  static Color primary500 = hexToColor('#7357FF');
  static Color primary600 = hexToColor('#6347F4');
  static Color primary700 = hexToColor('#553ADE');
  static Color primary800 = hexToColor('#3C28A4');
  static Color primary900 = hexToColor('#21194D');

  static Color secondary25 = hexToColor('#F2FFFC');
  static Color secondary50 = hexToColor('#EBFCF9');
  static Color secondary75 = hexToColor('#DAF7EF');
  static Color secondary100 = hexToColor('#BEF7E7');
  static Color secondary200 = hexToColor('#93F1D6');
  static Color secondary300 = hexToColor('#68EBC5');
  static Color secondary400 = hexToColor('#3DE5B4');
  static Color secondary500 = hexToColor('#12DFA3');
  static Color secondary600 = hexToColor('#0EAE80');
  static Color secondary700 = hexToColor('#0A7C5B');
  static Color secondary800 = hexToColor('#064A36');
  static Color secondary900 = hexToColor('#021811');

  static Color g25 = hexToColor('#F8F8F8');
  static Color g50 = hexToColor('#F3F3F4');
  static Color g75 = hexToColor('#ECECED');
  static Color g100 = hexToColor('#E2E2E4');
  static Color g150 = hexToColor('#E2E4EB');
  static Color g200 = hexToColor('#D9D8DC');
  static Color g250 = hexToColor('#CACCD5');
  static Color g300 = hexToColor('#C6C5CA');
  static Color g350 = hexToColor('#B2B4BF');
  static Color g400 = hexToColor('#B3B1B8');
  static Color g450 = hexToColor('#9A9CA9');
  static Color g500 = hexToColor('#8D8A95');
  static Color g550 = hexToColor('#828493');
  static Color g600 = hexToColor('#676472');
  static Color g650 = hexToColor('#6A6C7D');
  static Color g700 = hexToColor('#4F4B5C');
  static Color g750 = hexToColor('#525467');
  static Color g800 = hexToColor('#2E293D');
  static Color g850 = hexToColor('#3A3C51');
  static Color g900 = hexToColor('#110C22');

  static Color white4 = hexToColor('#ffffff05');
  static Color white7 = hexToColor('#ffffff12');
  static Color white12 = hexToColor('#ffffff1f');
  static Color white16 = hexToColor('#ffffff29');
  static Color white20 = hexToColor('#ffffff33');
  static Color white24 = hexToColor('#ffffff3d');
  static Color white32 = hexToColor('#ffffff52');
  static Color white48 = hexToColor('#ffffff7a');
  static Color white64 = hexToColor('#ffffffa3');
  static Color white76 = hexToColor('#ffffffc2');
  static Color white88 = hexToColor('#ffffffe0');
  static Color white100 = hexToColor('#FFFFFFFF');

  static Color info25 = hexToColor('#F5FAFF');
  static Color info50 = hexToColor('#E9F4FF');
  static Color info75 = hexToColor('#C2E2FF');
  static Color info100 = hexToColor('#A0D2FF');
  static Color info200 = hexToColor('#71BBFF');
  static Color info300 = hexToColor('#45A6FF');
  static Color info400 = hexToColor('#1C92FF');
  static Color info500 = hexToColor('#0084FF');
  static Color info600 = hexToColor('#0076E2');
  static Color info700 = hexToColor('#0057A7');
  static Color info800 = hexToColor('#0C355A');
  static Color info900 = hexToColor('#0D1C2B');

  static Color success25 = hexToColor('#F3FDF8');
  static Color success50 = hexToColor('#E2FCF0');
  static Color success75 = hexToColor('#C6F1DD');
  static Color success100 = hexToColor('#A6E9C8');
  static Color success200 = hexToColor('#6FDAA6');
  static Color success300 = hexToColor('#4DCC8F');
  static Color success400 = hexToColor('#28C07A');
  static Color success500 = hexToColor('#0BAA60');
  static Color success600 = hexToColor('#0A9C55');
  static Color success700 = hexToColor('#0C7844');
  static Color success800 = hexToColor('#104B2F');
  static Color success900 = hexToColor('#0D1F11');

  static Color warning25 = hexToColor('#FFFAED');
  static Color warning50 = hexToColor('#FFF5DB');
  static Color warning75 = hexToColor('#FFECBA');
  static Color warning100 = hexToColor('#FFDD86');
  static Color warning200 = hexToColor('#FFCB45');
  static Color warning300 = hexToColor('#FDBA0F');
  static Color warning400 = hexToColor('#F2AA09');
  static Color warning500 = hexToColor('#E09400');
  static Color warning600 = hexToColor('#D07D00');
  static Color warning700 = hexToColor('#B55E0F');
  static Color warning800 = hexToColor('#5C3111');
  static Color warning900 = hexToColor('#27170B');

  static Color error25 = hexToColor('#FFF9F9');
  static Color error50 = hexToColor('#FFF1F1');
  static Color error75 = hexToColor('#FFE0E0');
  static Color error100 = hexToColor('#FFC7C7');
  static Color error200 = hexToColor('#FFA7A7');
  static Color error300 = hexToColor('#FF8080');
  static Color error400 = hexToColor('#F95E5E');
  static Color error500 = hexToColor('#F03D3D');
  static Color error600 = hexToColor('#CF2A2A');
  static Color error700 = hexToColor('#A41F1F');
  static Color error800 = hexToColor('#591A1A');
  static Color error900 = hexToColor('#271111');

  static Color sysLightAlert = hexToColor('#F55858');
  static Color sysDarkAlert = hexToColor('#BA4343');
  static Color sysLightAction = hexToColor('#4D87FA');
  static Color sysDarkAction = hexToColor('#3D6AC4');
  static Color sysLightWarning = hexToColor('#E9A743');
  static Color sysDarkWarning = hexToColor('#A66930');
  static Color oGreen1 = hexToColor('#3FB483');
  static Color oGreen2 = hexToColor('#0CD68A');
  static Color oGreen3 = hexToColor('#EDF7F9');
  static Color oYellow1 = hexToColor('#FFCB46');
  static Color oYellow2 = hexToColor('#DFAD2E');
  static Color oLightBlue = hexToColor('#D8E0FC');
  static Color transparent = Colors.transparent;
  static Color switchColor = hexToColor('#5856D6');
  static Color pPink = hexToColor('#F73898');
  static Color sDarkHeadline = hexToColor('#080860');
}

class TextColors {
  static Color textHighEm = ColorPalettes.g900;
  static Color iconHighEm = ColorPalettes.g700;
  static Color textMedEm = ColorPalettes.g600;
  static Color iconMedEm = ColorPalettes.g500;
  static Color textLowEm = ColorPalettes.g400;
  static Color iconLowEm = ColorPalettes.g300;
  static Color textWhite = ColorPalettes.white100;
  static Color textDisabled = ColorPalettes.g200;
  static Color primary = ColorPalettes.primary500;
  static Color primaryLow = ColorPalettes.primary75;
  static Color primaryMed = ColorPalettes.primary200;
  static Color primaryBold = ColorPalettes.primary800;
  static Color success = ColorPalettes.success500;
  static Color info = ColorPalettes.info500;
  static Color warning = ColorPalettes.warning500;
  static Color warningBlod = ColorPalettes.warning700;
  static Color error = ColorPalettes.error500;
}

class SurfaceColors {
  static Color surfaceWhite = ColorPalettes.white100;
  static Color low = ColorPalettes.g25;
  static Color med = ColorPalettes.g50;
  static Color high = ColorPalettes.g75;
  static Color primary = ColorPalettes.primary500;
  static Color primaryAccentBase = ColorPalettes.primary25;
  static Color primaryAccent1 = ColorPalettes.primary50;
  static Color primaryAccent2 = ColorPalettes.primary75;
  static Color info = ColorPalettes.info500;
  static Color infoAccentBase = ColorPalettes.info25;
  static Color infoAccent1 = ColorPalettes.info50;
  static Color infoyAccent2 = ColorPalettes.info75;
  static Color success = ColorPalettes.success500;
  static Color successAccentBase = ColorPalettes.success25;
  static Color successAccent1 = ColorPalettes.success50;
  static Color successyAccent2 = ColorPalettes.success75;
  static Color warning = ColorPalettes.warning500;
  static Color warningAccentBase = ColorPalettes.warning25;
  static Color warningAccent1 = ColorPalettes.warning50;
  static Color warningAccent2 = ColorPalettes.warning75;
  static Color error = ColorPalettes.error500;
  static Color errorAccent1 = ColorPalettes.error50;
  static Color errorAccent2 = ColorPalettes.error75;
  static Color disabledLow = ColorPalettes.g75;
  static Color disabledMed = ColorPalettes.g100;
}

class OutlineColors {
  static Color white = ColorPalettes.white100;
  static Color low = ColorPalettes.g25;
  static Color med = ColorPalettes.g50;
  static Color high = ColorPalettes.g200;
  static Color extreme = ColorPalettes.g300;
  static Color primary = ColorPalettes.primary500;
  static Color primaryLow = ColorPalettes.primary75;
  static Color primaryMed = ColorPalettes.primary100;
  static Color primaryHigh = ColorPalettes.primary300;
  static Color success = ColorPalettes.success500;
  static Color successLow = ColorPalettes.success75;
  static Color successMed = ColorPalettes.success200;
  static Color error = ColorPalettes.error500;
  static Color errorLow = ColorPalettes.error75;
  static Color errorMed = ColorPalettes.error200;
  static Color errorHigh = ColorPalettes.error300;
  static Color info = ColorPalettes.info500;
  static Color infoLow = ColorPalettes.info75;
  static Color infoMed = ColorPalettes.info100;
  static Color warning = ColorPalettes.warning500;
  static Color warningLow = ColorPalettes.warning75;
  static Color warningMed = ColorPalettes.warning200;
  static Color secondary = ColorPalettes.secondary500;
  static Color secondaryLow = ColorPalettes.secondary75;
  static Color secondaryMed = ColorPalettes.secondary100;
  static Color secondaryHigh = ColorPalettes.secondary300;
}

class BoxShadowStyle {
  //box-shadow: 0px(dx) 1px(dy) 2px(blurRadius) -1px(spreadRadius)
  static BoxShadow e01 = const BoxShadow(
    color: Color.fromRGBO(17, 12, 34, 0.08),
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: -1,
  );
  static BoxShadow e02 = const BoxShadow(
    color: Color.fromRGBO(17, 12, 34, 0.12),
    offset: Offset(0, 2),
    blurRadius: 4,
    spreadRadius: -2,
  );
  static BoxShadow e03 = const BoxShadow(
    color: Color.fromRGBO(17, 12, 34, 0.1),
    offset: Offset(0, 6),
    blurRadius: 16,
    spreadRadius: -6,
  );
  static BoxShadow e04 = const BoxShadow(
    color: Color.fromRGBO(17, 12, 34, 0.1),
    offset: Offset(0, 16),
    blurRadius: 20,
    spreadRadius: -8,
  );
  static BoxShadow e05 = const BoxShadow(
    color: Color.fromRGBO(17, 12, 34, 0.1),
    offset: Offset(0, 20),
    blurRadius: 24,
    spreadRadius: -10,
  );
  static BoxShadow e06 = const BoxShadow(
    color: Color.fromRGBO(17, 12, 34, 0.12),
    offset: Offset(0, 32),
    blurRadius: 32,
    spreadRadius: -12,
  );
  static List<BoxShadow> primary = [
    const BoxShadow(
      color: Color.fromRGBO(17, 12, 34, 0.12),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: hexToColor('#E2DCFF'),
      offset: const Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 4,
    ),
  ];
  static List<BoxShadow> gray = [
    const BoxShadow(
      color: Color.fromRGBO(17, 12, 34, 0.12),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: hexToColor('#ECECED'),
      offset: const Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 4,
    ),
  ];
  static List<BoxShadow> info = [
    const BoxShadow(
      color: Color.fromRGBO(17, 12, 34, 0.12),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: hexToColor('#C2E2FF'),
      offset: const Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 4,
    ),
  ];
  static List<BoxShadow> success = [
    const BoxShadow(
      color: Color.fromRGBO(17, 12, 34, 0.12),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: hexToColor('#C6F1DD'),
      offset: const Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 4,
    ),
  ];
  static List<BoxShadow> error = [
    const BoxShadow(
      color: Color.fromRGBO(17, 12, 34, 0.12),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: hexToColor('#FFE0E0'),
      offset: const Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 4,
    ),
  ];
  static BoxShadow lSmall = const BoxShadow(
    color: Color.fromRGBO(79, 117, 140, 0.24),
    offset: Offset(0, 4),
    blurRadius: 16,
  );
  static BoxShadow lLarge = const BoxShadow(
    color: Color.fromRGBO(79, 117, 140, 0.24),
    offset: Offset(0, 4),
    blurRadius: 32,
  );
  static BoxShadow dSmall = const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.24),
    offset: Offset(0, 4),
    blurRadius: 16,
  );
  static BoxShadow dLarge = const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.24),
    offset: Offset(0, 4),
    blurRadius: 32,
  );
  static BoxShadow bottomSheet = const BoxShadow(
    color: Color.fromRGBO(79, 117, 140, 0.32),
    offset: Offset(0, 0),
    blurRadius: 24,
  );
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
