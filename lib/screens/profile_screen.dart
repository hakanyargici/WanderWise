import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.moon),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Text(
                      "KA",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Keyvan Arasteh"),
                    subtitle: Text("Ad Soyad"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("keyvan.arasteh@live.com"),
                    subtitle: Text("E-posta"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+90 123 456 7890"),
                    subtitle: Text("Telefon"),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("İstanbul, Türkiye"),
                    subtitle: Text("Adres"),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text("1 Ocak 1990"),
                    subtitle: Text("Doğum Tarihi"),
                  ),
                  ListTile(
                    leading: Icon(Icons.facebook),
                    title: Text("keyvan_arasteh"),
                    subtitle: Text("Facebook"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {},
            icon: Icon(Icons.logout),
            label: Text("Hesaptan Çıkış Yap"),
            style: FilledButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          if (context.canPop())
            TextButton.icon(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back),
              label: Text("Geri Dön"),
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
