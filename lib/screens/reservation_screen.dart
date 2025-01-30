import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final List<String> imageList = [
    "assets/images/sliderimage1.jpg",
    "assets/images/sliderimage2.jpg",
    "assets/images/sliderimage3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rezervasyon",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text('Sırala:',
                        style: Theme.of(context).textTheme.titleMedium),
                    ChoiceChip(
                      label: Text('Varsayılan'),
                      selected: true,
                      onSelected: (_) {},
                    ),
                    ChoiceChip(
                      label: Text('A-Z Sırala'),
                      selected: false,
                      onSelected: (_) {},
                    ),
                    ChoiceChip(
                      label: Text('Z-A Sırala'),
                      selected: false,
                      onSelected: (_) {},
                    ),
                    ChoiceChip(
                      label: Text('Fiyata Göre En Yüksek'),
                      selected: false,
                      onSelected: (_) {},
                    ),
                    ChoiceChip(
                      label: Text('Fiyata Göre En Düşük'),
                      selected: false,
                      onSelected: (_) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: imageList.length,
              itemBuilder: (context, index) => Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            child: Image.asset(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tatil ${index + 1}',
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            '₺${(index + 1) * 100}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 8),
                          FilledButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart, size: 18),
                            label: Text('Sepete Ekle'),
                            style: FilledButton.styleFrom(
                              minimumSize: Size(double.infinity, 36),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Filtrele'),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fiyat Aralığı',
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Min',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Max',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Bölgeler', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text('Asya'),
                  selected: true,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Avrupa'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Amerika'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Text('Rusya'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Arama', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Tatilini Ara',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Temizle'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Uygula'),
          ),
        ],
      ),
    );
  }
}
