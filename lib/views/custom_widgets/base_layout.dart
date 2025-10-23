import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final String headerTitle;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  const BaseLayout({
    super.key,
    required this.headerTitle,
    required this.children,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SideMenuScreen(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: padding ?? const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      ...children,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}