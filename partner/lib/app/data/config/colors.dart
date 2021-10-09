import 'package:flutter/material.dart';

/// ![#457b9d](https://via.placeholder.com/15/457b9d/000000?text=+) `#457b9d`
const Color kcAccent = const Color(0xff457b9d);

/// ![#e7eefe](https://via.placeholder.com/15/e7eefe/000000?text=+) `#e7eefe`
const Color kcBgAccent = const Color(0xffe7eefe);

/// ![#F2F0E4](https://via.placeholder.com/15/F2F0E4/000000?text=+) `#F2F0E4`
const Color kcBg = const Color(0xffF2F0E4);

/// ![#8B8383](https://via.placeholder.com/15/8B8383/000000?text=+) `#8B8383`
final Color kcGeryIcon = Color(0xff8B8383).withOpacity(0.9);

/// ![#666363](https://via.placeholder.com/15/666363/000000?text=+) `#666363`
const Color kcGrey = Color(0xff666363);

/// ![#C7C7C7](https://via.placeholder.com/15/C7C7C7/000000?text=+) `#C7C7C7`
const Color kcLightGrey = const Color(0xffC7C7C7);

/// ![#ededed](https://via.placeholder.com/15/ededed/000000?text=+) `#ededed`
const Color kcLameGrey = const Color(0xffededed);

/// ![#000000](https://via.placeholder.com/15/000000/000000?text=+) `#000000`
const Color kcBlack = Color(0xff000000);

/// ![#ffffff](https://via.placeholder.com/15/ffffff/000000?text=+) `#ffffff`
const Color kcWhite = Color(0xffffffff);

LinearGradient kcgButton = LinearGradient(
  begin: Alignment(-1.67, -0.36),
  end: Alignment(1.92, 0.38),
  colors: [kcAccent, kcAccent.withOpacity(0.9)],
  stops: [0.0, 1.0],
);

LinearGradient kcgBlackDown = LinearGradient(
  // begin: Alignment(-1.67, -0.36),
  // end: Alignment(1.92, 0.38),
  colors: [Colors.transparent, kcBlack.withOpacity(0.9)],
  stops: [0.0, 1.0],
);


// const color2 = const Color(0xffF2F0E4);
// const color1 = const Color(0xff2871FF);
// const color1 = const Color(0xffe7eefe);

// const Color kcPink = const Color(0xfffe7078);
// const Color kcLightPink = const Color(0xb8fc7f8e);
// MaterialColor kcMainPink = MaterialColor(
//   0xFFFA4B74,
//   pinkMaterialColor,
// );

// Map<int, Color> pinkMaterialColor = {
//   50: Color.fromRGBO(248, 78, 127, .1),
//   100: Color.fromRGBO(248, 78, 127, .2),
//   200: Color.fromRGBO(248, 78, 127, .3),
//   300: Color.fromRGBO(248, 78, 127, .4),
//   400: Color.fromRGBO(248, 78, 127, .5),
//   500: Color.fromRGBO(248, 78, 127, .6),
//   600: Color.fromRGBO(248, 78, 127, .7),
//   700: Color.fromRGBO(248, 78, 127, .8),
//   800: Color.fromRGBO(248, 78, 127, .9),
//   900: Color.fromRGBO(248, 78, 127, 1),
// };
