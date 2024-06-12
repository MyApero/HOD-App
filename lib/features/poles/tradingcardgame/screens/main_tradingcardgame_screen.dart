import 'package:flutter/material.dart';
import 'package:hod_app/features/poles/widget/event_details_screen.dart';

class MainTradingCardGameScreen extends StatelessWidget {
  const MainTradingCardGameScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => MainTradingCardGameScreen());

  @override
  Widget build(BuildContext context) {
    return EventDetailsScreen(title: "Trading card games", pole: "tradingcardgame",);
  }
}
