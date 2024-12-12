import 'package:flutter/material.dart';
import 'package:midterm/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlogCategoryScreen(),
    );
  }
}

class BlogCategoryScreen extends StatefulWidget {
  @override
  _BlogCategoryScreenState createState() => _BlogCategoryScreenState();
}

class _BlogCategoryScreenState extends State<BlogCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Seyahat Yazıları'),
              onTap: () {
                Navigator.pop(context);
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
            width: screenWidth * 0.5,
            height: screenHeight * 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popüler Seyahat Kategorileri',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF7043),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Burada, seyahat ile ilgili en popüler blog yazılarını bulabilirsiniz. İlginizi çeken bir kategoriyi seçerek daha fazla keşfedin.',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth < 600 ? 2 : 3,
                  crossAxisSpacing: screenWidth * 0.09,
                  mainAxisSpacing: screenHeight * 0.02,
                  childAspectRatio: 0.5,
                ),
                itemCount: blogItems.length,
                itemBuilder: (context, index) {
                  return BlogItem(
                    imageUrl: blogItems[index]['imageUrl']!,
                    title: blogItems[index]['title']!,
                    description: blogItems[index]['description']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const BlogItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailScreen(
              imageUrl: imageUrl,
              title: title,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const BlogDetailScreen({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
final List<Map<String, String>> blogItems = [
  {
    'imageUrl': 'assets/bali.jpg',
    'title': "Bali'nin En Güzel Yerleri",
    'description': "Bali'yi keşfet! Endonezya’nın turistik cenneti olan bu ada, beyaz kumlu plajları, etkileyici volkanik dağları ve eşsiz Hindu kültürüyle tanınır. Ubud gibi sanat ve yoga merkezleriyle ünlüdür. Bali’nin tapınakları, özellikle Tanah Lot ve Uluwatu Tapınağı, ziyaretçilerin ilgisini çeker. Ayrıca, dalış ve sörf gibi aktiviteler için de oldukça popülerdir. olan bu ada, beyaz kumlu plajları, etkileyici volkanik dağları ve eşsiz Hindu kültürüyle tanınır.",
  },
  {
    'imageUrl': 'assets/paris.jpg',
    'title': "Paris'te 3 Gün",
    'description': "Fransa’nın başkenti ve “Aşıklar Şehri” olarak anılan Paris, tarihi ve kültürel zenginlikleriyle büyüler. Eyfel Kulesi, Notre Dame Katedrali ve Sacré-Cœur Bazilikası gibi simge yapılarıyla tanınır. Louvre Müzesi, sanat tutkunları için bir cennettir. Seine Nehri boyunca yapılan tekne turları, şehri romantik bir perspektiften keşfetme fırsatı sunar. Moda ve gastronomi dünyasında da önemli bir yere sahiptir."},
  {
    'imageUrl': 'assets/yenizellanda.jpg',
    'title': "Yeni Zelanda",
    'description': "Macera dolu bir keşif. Pasifik Okyanusu’nda iki ana ada ve birçok küçük adadan oluşan bir ülke olan Yeni Zelanda, nefes kesen doğal güzellikleriyle ünlüdür. Güney Adası’ndaki Fiordland Ulusal Parkı ve Milford Sound, dünya çapında doğa tutkunlarını çeker. Kuzey Adası’nda Rotorua’nın jeotermal aktiviteleri ve Maori kültürü öne çıkar. Ayrıca, “Yüzüklerin Efendisi” filmlerine ev sahipliği yapan manzaralarıyla da tanınır. Ülke, macera sporları ve ekoturizm açısından oldukça gelişmiştir." },
];