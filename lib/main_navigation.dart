import 'package:flutter/material.dart';
import 'package:najma_app/hub_icon.dart';
import 'package:najma_app/reels_icon.dart';
import 'package:najma_app/create_icon.dart';
import 'package:najma_app/market_icon.dart';
import 'package:najma_app/profile_icon.dart';
import 'package:najma_app/starpay_wallet.dart';
import 'package:najma_app/database_service.dart';
import 'package:najma_app/star_market.dart';
import 'package:najma_app/star_live.dart';
import 'package:najma_app/najma_reels.dart';
import 'package:najma_app/star_chat.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const StarChat(),
    const NajmaReels(),
    const StarLive(),
    const StarMarket(),
    const StarPayWallet(),
  ];

  @override
  void initState() {
    super.initState();
    DatabaseService.fetchViralReels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          border: Border(top: BorderSide(color: Colors.white.withOpacity(0.08), width: 1)),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HubIcon(isActive: _currentIndex == 0, onTap: () => setState(() => _currentIndex = 0)),
              ReelsIcon(isActive: _currentIndex == 1, onTap: () => setState(() => _currentIndex = 1)),
              CreateIcon(onTap: () => setState(() => _currentIndex = 2)),
              MarketIcon(isActive: _currentIndex == 3, onTap: () => setState(() => _currentIndex = 3)),
              ProfileIcon(isActive: _currentIndex == 4, onTap: () => setState(() => _currentIndex = 4)),
            ],
          ),
        ),
      ),
    );
  }
}

