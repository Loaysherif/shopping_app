import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/PageViewItems.dart';
import '../widgets/custom_text.dart';
import '../widgets/products_grid.dart';
import '../widgets/hot_offers_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Use vertical scrolling for the page
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: tr("Shopping App"),
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(icon: Icon(Icons.language), onPressed: changeLanguage),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Our Products
            CustomText(
              text: tr("our_products"),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: PageView(
                children: const [
                  PageViewItems(
                    phoneModel: "Samsung Galaxy S24",
                    imgUrl:
                        "https://images.samsung.com/eg/smartphones/galaxy-s24/buy/product_color_yellow_plus.png?imwidth=480",
                  ),
                  PageViewItems(
                    phoneModel: "Samsung Galaxy S24 Ultra",
                    imgUrl:
                        "https://images.samsung.com/eg/smartphones/galaxy-s24-ultra/buy/product_color_gray.png?imwidth=480",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Section: Products Grid (2 cards per row)
            const ProductsGrid(),
            const SizedBox(height: 16),
            // Section: Hot Offers (Horizontal ListView)
            CustomText(
              text: tr("hot_offers"),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            const HotOffersList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // دالة تغيير اللغة
  void changeLanguage() {
    Locale currentLocale = context.locale;
    if (currentLocale.languageCode == 'en' &&
        currentLocale.countryCode == 'US') {
      EasyLocalization.of(context)!.setLocale(Locale('ar', 'EG'));
    } else {
      EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
    }
    setState(() {}); // تحديث الواجهة بعد تغيير اللغة
  }
}
