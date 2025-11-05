import 'package:flutter/material.dart';
import '../../widgets/app_bottom_nav.dart';

class TentangGetxView extends StatelessWidget {
  const TentangGetxView({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang GetX')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 4),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, size: 80, color: cs.primary),
                const SizedBox(height: 16),
                Text(
                  'Tentang GetX',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'GetX adalah paket Flutter yang menyediakan tiga hal utama: '
                  'State Management, Routing (navigasi), dan Dependency Injection. '
                  'GetX populer karena API-nya sederhana, ringan, dan performanya tinggi.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // --- Apa itu GetX ------------------------------------------------
                const _Section(
                  title: 'Apa itu GetX?',
                  child: Text(
                    'GetX adalah framework helper untuk Flutter yang memudahkan pengelolaan state, '
                    'navigasi antar halaman, dan pemanggilan dependensi (service, controller). '
                    'Dengan pendekatan reaktif (Rx), UI akan otomatis memperbarui ketika data berubah.',
                    textAlign: TextAlign.center,
                  ),
                ),

                // --- Fitur Utama -------------------------------------------------
                _Section(
                  title: 'Fitur Utama GetX',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bullet(
                        context,
                        'State Management reaktif (Rx, Obx, GetBuilder).',
                      ),
                      _bullet(
                        context,
                        'Routing & Navigasi sederhana (GetMaterialApp, Get.toNamed).',
                      ),
                      _bullet(
                        context,
                        'Dependency Injection (Get.put, Get.find).',
                      ),
                      _bullet(
                        context,
                        'Utility: snackbar, dialog, bottom sheet, internationalization.',
                      ),
                    ],
                  ),
                ),

                // --- Komponen GetX ------------------------------------------------
                _Section(
                  title: 'Komponen di GetX',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label(context, '1) State Management'),
                      _muted(
                        context,
                        '• Gunakan `.obs` untuk membuat data reaktif, dan `Obx()` untuk membangun UI yang '
                        'otomatis update saat data berubah. Alternatif lain: `GetBuilder` untuk update spesifik.',
                      ),
                      const SizedBox(height: 10),
                      _label(context, '2) Routing & Navigasi'),
                      _muted(
                        context,
                        '• Daftarkan rute di `GetMaterialApp(getPages: ...)`, lalu panggil `Get.toNamed("/route")`, '
                        '`Get.offNamed(...)`, atau `Get.offAllNamed(...)`. Kembali dengan `Get.back()`.',
                      ),
                      const SizedBox(height: 10),
                      _label(context, '3) Dependency Injection'),
                      _muted(
                        context,
                        '• Daftarkan controller/service dengan `Get.put(YourController())`, lalu ambil '
                        'di mana pun dengan `Get.find<YourController>()`.',
                      ),
                    ],
                  ),
                ),

                // --- Best Practices ----------------------------------------------
                _Section(
                  title: 'Best Practices',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bullet(
                        context,
                        'Pisahkan file: view (UI) vs controller/service (logika).',
                      ),
                      _bullet(
                        context,
                        'Gunakan `Bindings`/`Get.put` saat inisialisasi halaman.',
                      ),
                      _bullet(
                        context,
                        'Hindari meletakkan logika bisnis berat di widget.',
                      ),
                      _bullet(
                        context,
                        'Gunakan `.close()`/`onClose()` untuk membersihkan resource.',
                      ),
                    ],
                  ),
                ),

                // --- Kapan Menggunakan GetX? -------------------------------------
                _Section(
                  title: 'Kapan Menggunakan GetX?',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bullet(
                        context,
                        'Aplikasi membutuhkan navigasi sederhana dan cepat.',
                      ),
                      _bullet(
                        context,
                        'Butuh state reaktif ringan tanpa boilerplate rumit.',
                      ),
                      _bullet(
                        context,
                        'Ingin DI yang praktis untuk controller/service.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // helper teks poin
  static Widget _bullet(BuildContext context, String text) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: cs.primary, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  // helper subjudul kecil
  static Widget _label(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
    );
  }

  // helper deskripsi samar
  static Widget _muted(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

// komponen section seragam
class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceVariant.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
