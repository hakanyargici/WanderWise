import 'package:flutter/material.dart';
import 'blog_category.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Icon(Icons.account_circle, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Hoşgeldin, Keyvan!", style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Seyahat Yazıları'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogCategoryScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.menu, size: 35),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: Image.asset(
            'assets/WanderWise.png',
            width: screenWidth * 0.5, // Logonun genişliği
            height: screenHeight * 0.5, // Logonun yüksekliği
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Slider (Görsel Kaydırıcı)
            Container(
              height: 250,
              child: PageView(
                children: [
                  Image.asset('../assets/sliderimage1.jpg', fit: BoxFit.cover),
                  Image.asset('../assets/sliderimage2.jpg', fit: BoxFit.cover),
                  Image.asset('../assets/sliderimage3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),

            // 2. Blog Önizleme Kısımları
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Popüler Seyahat Yazıları",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 230, // Yüksekliği mobil uyumlu tutuyoruz
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildBlogPreview(
                    'assets/paris.jpg',
                    'Paris\'te 3 Gün: Gezi Rehberi',
                  ),
                  buildBlogPreview(
                    '../assets/yenizellanda.jpg',
                    'Yeni Zelanda: Doğanın Cenneti',
                  ),
                  buildBlogPreview(
                    'assets/bali.jpg',
                    'Bali\'nin En Güzel Yerleri',
                  ),
                ],
              ),
            ),

            // 3. Popüler Kategoriler
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Popüler Kategoriler",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: [
                buildCategoryCard('Doğa', Icons.nature),
                buildCategoryCard('Kültür', Icons.account_balance),
                buildCategoryCard('Yemek', Icons.restaurant),
                buildCategoryCard('Tarihi Yerler', Icons.history),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlogPreview(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, width: 180, height: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildCategoryCard(String category, IconData icon) {
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          // Kategoriye tıklayınca yapılacak işlemler
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(
              category,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
