import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Image.asset(
              themeProvider.logoAsset,
              height: 75,
              width: 200,
              fit: BoxFit.contain,
            );
          },
        ),
        centerTitle: true,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(
                  themeProvider.isDark
                      ? CupertinoIcons.moon_fill
                      : CupertinoIcons.sun_max_fill,
                ),
                onPressed: () {
                  context.read<ThemeProvider>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: Text("Hoşgeldiniz"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text('Adı: YUSUF HAKAN YARGICI'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text('Öğrenci Numarası: 2320161118'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.calendar),
              title: Text('Doğum Tarihi: 25/06/01'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail_solid),
              title: Text('E-Posta: hakanyargici@outlook.com'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone),
              title: Text('Telefon: 0 545 650 9460'),
            ),
            Divider(),
            ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text('Adı: RECEP ŞAHİN'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text('Öğrenci Numarası: 2320161109'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.calendar),
              title: Text('Doğum Tarihi: 21/08/03'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail_solid),
              title: Text('E-Posta: recepsahin@outlook.com'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone),
              title: Text('Telefon: 0 546 547 5214'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Popüler Konumları Keşfedin",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Expanded(
              child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                crossAxisCount: 3, // 3 öğe yan yana
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: Image.asset('assets/images/bali.jpg',
                              fit: BoxFit.cover)),
                      Text("Bali"),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                          child: Image.asset('assets/images/paris.jpg',
                              fit: BoxFit.cover)),
                      Text("Paris"),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                          child: Image.asset('assets/images/yenizellanda.jpg',
                              fit: BoxFit.cover)),
                      Text("Yeni Zellanda"),
                    ],
                  ),
                ],
              ),
            ),
            // Yeni eklenen alan: Ekranın yarısı
            Container(
              height: 250, // Bu kısmı ihtiyacınıza göre ayarlayabilirsiniz
              child: Row(
                children: [
                  // Sol taraf: Görsel
                  Expanded(
                    child: Image.asset(
                      'assets/images/bali.jpg', // Görseli değiştir
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Sağ taraf: Başlık, Metin ve Buton
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bali - Tropik Cennet",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Bali'nin eşsiz plajlarını ve doğal güzelliklerini keşfedin.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.read_more, size: 18),
                            label: Text('Daha Fazla Oku'),
                            style: FilledButton.styleFrom(
                              minimumSize: Size(double.infinity, 36),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
