import 'package:flutter/material.dart';

class Responsive {
  static late double width;
  static late double height;

  static void init(BuildContext context){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  static bool get isMobile => width < 600;
  static bool get isTablet => width >= 600 && width < 1024;
  static bool get isDesktop => width >= 1024;

  // ################ Text Sizes ################
  static double get heading {
    if(isDesktop) return 35;
    if(isTablet) return 23;
    return 28;    /// mobile
  }

  static double get subHeading {
    if(isDesktop) return 24;
    if(isTablet) return 20;
    return 18;
  }

  static double get paragraph {
    if(isDesktop) return 18;
    if(isTablet) return 16;
    return 14;
  }
  
  static double get cardHeading {
    if(isDesktop) return 17;
    if(isTablet) return 15;
    return 13; 
  }

  static double get cardParagraph {
    if(isDesktop) return 15;
    if(isTablet) return 12;
    return 10;
  }
  
  static double get buttonHeight {
    if(isDesktop) return 40;
    if(isTablet) return 38;
    return 37;
  }

  // this name suggest that for desktop we have 28px ssize and it will reduce accordingly to screen size 
  static double get desktopText30 {
    if(isDesktop) return 30;
    if(isTablet) return 28;
    return 26;
  }

  static double get desktopText24 {
    if(isDesktop) return 24;
    if(isTablet) return 22;
    return 20;
  }
  
  static double get desktopText20 {
    if(isDesktop) return 20;
    if(isTablet) return 18;
    return 17;
  }

  static double get desktopText18 {
    if(isDesktop) return 18;
    if(isTablet) return 17;
    return 16;
  }

  static double get desktopText16 {
    if(isDesktop) return 16;
    if(isTablet) return 15;
    return 14;
  }
  
  static double get desktopText14 {
    if(isDesktop) return 14;
    return 13;
  }
  

  static double get desktopText12 {
    if(isDesktop) return 12;
    if(isTablet) return 10;
    return 9;
  }


  // ################ Icon / Floating Button Sizes ################
  static double get floatingButtonSize {
    if(isDesktop) return 60;
    if(isTablet) return 53;
    return 43.5; // Mobile
  }

  static double get floatingIconSize {
    if(isDesktop) return 28;
    if(isTablet) return 24;
    return 20; // Mobile
  }

  static double get floatingBadgeSize {
    if(isDesktop) return 24;
    if(isTablet) return 20;
    return 16;
  }

  static double get floatingBadgeFont {
    if(isDesktop) return 12;
    if(isTablet) return 10;
    return 8;
  }
}