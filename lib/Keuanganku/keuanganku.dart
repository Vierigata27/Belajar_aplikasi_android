import 'package:flutter/material.dart';

// Definisi kelas Product
class Product {
  final String imageUrl;
  final String name;
  final String size;
  final double price;
  final String deliveryInfo;
  final double? originalPrice;
  final String? discountPercentage;
  final bool isOnlineProduct;

  const Product({
    required this.imageUrl,
    required this.name,
    required this.size,
    required this.price,
    required this.deliveryInfo,
    this.originalPrice,
    this.discountPercentage,
    this.isOnlineProduct = false,
  });
}

class Keuanganku extends StatelessWidget {
  const Keuanganku({super.key});

  final List<Product> products = const [
    const Product(
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
      name: 'Diabetasol Pemanis Gula Tanpa Kalori',
      size: '50 g',
      price: 41.700,
      deliveryInfo: 'Pengiriman Instan',
    ),
    const Product(
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
      name: 'Diabetasol Susu Bubuk Dewasa Vanila',
      size: '170 g',
      price: 51.800,
      deliveryInfo: 'Beli 2 : Rp 48.300 / pcs\nPengiriman Instan',
    ),
    const Product(
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
      name: 'Diabetasol Susu Bubuk Dewasa Vanila',
      size: '570 g',
      price: 165.900,
      deliveryInfo: 'Pengiriman Instan',
    ),
    const Product(
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
      name: 'Diabetasol Camilan Wafer Cokelat',
      size: '2x50 g',
      price: 20.000,
      originalPrice: 22.000,
      discountPercentage: '9%',
      deliveryInfo: 'Pengiriman 1-3 Hari',
      // isOnlineProduct: true,
    ),
    const Product(
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
      name: 'Diabetasol Susu Bubuk Dewasa Vanila',
      size: '570 g',
      price: 165.900,
      deliveryInfo: 'Pengiriman Instan',
    ),
    const Product(
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
      name: 'Diabetasol Susu Bubuk Dewasa Vanila',
      size: '570 g',
      price: 165.900,
      deliveryInfo: 'Pengiriman Instan',
    ),
    const Product(
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
      name: 'Diabetasol Camilan Wafer Cokelat',
      size: '2x50 g',
      price: 20.000,
      originalPrice: 22.000,
      discountPercentage: '9%',
      deliveryInfo: 'Pengiriman 1-3 Hari',
      // isOnlineProduct: true,
    ),
  ];

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (product.isOnlineProduct)
            //   Align(
            //     alignment: Alignment.topLeft,
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            //       decoration: BoxDecoration(
            //         color: Colors.red[700],
            //         borderRadius: BorderRadius.circular(4),
            //       ),
            //       child: const Text(
            //         'PRODUK ONLINE',
            //         style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            Expanded(
              child: Center(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.contain,
                  height: 150,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 50);
                  },
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              product.size,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Rp ${product.price.toStringAsFixed(3)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
                if (product.originalPrice != null) ...[
                  const SizedBox(width: 4.0),
                  Text(
                    'Rp ${product.originalPrice!.toStringAsFixed(3)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ],
            ),
            if (product.discountPercentage != null)
              Text(
                '${product.discountPercentage} %',
                style: TextStyle(fontSize: 12, color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 4.0),
            Text(
              product.deliveryInfo,
              style: TextStyle(fontSize: 10, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Tambahkan logika untuk menambah ke keranjang
                },
                icon: const Icon(Icons.add_shopping_cart, size: 18),
                label: const Text('Keranjang'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KeuanganKu'),
        leading: const Icon(Icons.home),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),

      // Hapus SingleChildScrollView di sini
      body: Column( // Column adalah anak langsung dari body
        children: [  
          // Daftar Produk dalam Grid (mengambil sisa ruang dan bisa digulir)
          Expanded( // Expanded di sini sudah benar karena parent-nya (Column) punya batasan
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.6,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(product);
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            // PERBAIKAN DI SINI: Gunakan properti 'color' untuk Icon
            icon: Icon(
              Icons.money_off_csred_outlined),
            label: 'Keuangan', // Label yang lebih sesuai jika ikonnya money_off
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: 0,
        // selectedItemColor ini akan menimpa warna individual jika item dipilih.
        // Jika Anda ingin warna ikon berubah saat dipilih, ini yang digunakan.
        selectedItemColor: const Color.fromARGB(255, 172, 102, 12),
        // unselectedItemColor juga bisa ditambahkan jika ingin warna ikon berbeda saat tidak dipilih.
        unselectedItemColor: Colors.grey, // Contoh warna untuk item tidak terpilih
        onTap: (index) {
          print('Item yang diklik: $index');
        },
      ),
    );
  }
}