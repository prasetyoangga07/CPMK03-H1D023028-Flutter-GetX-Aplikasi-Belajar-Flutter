import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_flutter_getx/app/routes/app_pages.dart';
import 'package:belajar_flutter_getx/app/widgets/app_bottom_nav.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Belajar Flutter')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.school, size: 90, color: Colors.blue),
                const SizedBox(height: 16),
                Text(
                  'Aplikasi Belajar Flutter',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Aplikasi ini dirancang untuk membantu kamu memahami dasar-dasar Flutter, '
                  'sebuah framework dari Google untuk membuat aplikasi mobile, web, dan desktop '
                  'dengan satu basis kode. Melalui aplikasi ini, kamu akan belajar tentang '
                  'Widget Dasar, State Management, Routing & Navigasi, dan pengenalan GetX.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Materi Pembelajaran',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 12),
                _menuTile(
                  icon: Icons.widgets,
                  title: 'Widget Dasar',
                  subtitle:
                      'Pelajari Text, Container, Row, Column, Image, dan elemen dasar Flutter lainnya.',
                  onTap: () => Get.toNamed(Routes.widgetDasar),
                ),
                _menuTile(
                  icon: Icons.manage_accounts,
                  title: 'State Management',
                  subtitle:
                      'Belajar bagaimana Flutter mengelola data dinamis menggunakan GetX (Obx & Rx).',
                  onTap: () => Get.toNamed(Routes.stateManagement),
                ),
                _menuTile(
                  icon: Icons.alt_route,
                  title: 'Routing & Navigasi',
                  subtitle:
                      'Pahami cara berpindah antar halaman menggunakan Get.toNamed() dan Get.back().',
                  onTap: () => Get.toNamed(Routes.routingNavigasi),
                ),
                _menuTile(
                  icon: Icons.info_outline,
                  title: 'Tentang GetX',
                  subtitle:
                      'Pelajari apa itu GetX dan bagaimana kemudahannya dalam pengembangan aplikasi Flutter.',
                  onTap: () => Get.toNamed(Routes.tentangGetx),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Dikembangkan oleh:\nPrasetyo Angga Permana\nNIM: H1D023028',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _menuTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
