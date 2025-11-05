import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../../widgets/app_bottom_nav.dart';

class RoutingNavigasiView extends StatelessWidget {
  const RoutingNavigasiView({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Routing & Navigasi')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alt_route, size: 80, color: cs.primary),
                const SizedBox(height: 16),
                Text(
                  'Routing & Navigasi',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pada aplikasi Flutter + GetX, navigasi dilakukan dengan menamai rute '
                  'dan memanggil helper seperti Get.toNamed(), Get.offNamed(), dan Get.back(). '
                  'Semua rute didefinisikan di AppPages.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // --- Seksi 1: Pindah Halaman -----------------------------------
                _Section(
                  title: '1) Pindah Halaman (push)',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Menambah halaman baru ke atas stack: pengguna bisa kembali dengan Get.back().',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      FilledButton(
                        onPressed: () => Get.toNamed(Routes.widgetDasar),
                        child: const Text('Get.toNamed(Routes.widgetDasar)'),
                      ),
                    ],
                  ),
                ),

                // --- Seksi 2: Ganti Halaman (replace) ---------------------------
                _Section(
                  title: '2) Ganti Halaman (replace)',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Mengganti halaman saat ini (tidak bisa kembali ke halaman lama).',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () => Get.offNamed(Routes.stateManagement),
                        child: const Text(
                          'Get.offNamed(Routes.stateManagement)',
                        ),
                      ),
                    ],
                  ),
                ),

                // --- Seksi 3: Reset Stack --------------------------------------
                _Section(
                  title: '3) Reset Semua (clear stack)',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Menghapus semua halaman sebelumnya dan menuju tujuan akhir.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () => Get.offAllNamed(Routes.tentangGetx),
                        child: const Text(
                          'Get.offAllNamed(Routes.tentangGetx)',
                        ),
                      ),
                    ],
                  ),
                ),

                // --- Seksi 4: Kembali ------------------------------------------
                _Section(
                  title: '4) Kembali',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Menutup halaman teratas pada stack dan kembali ke halaman sebelumnya.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Get.back()'),
                      ),
                    ],
                  ),
                ),

                // --- Seksi 5: Kirim Argumen -------------------------------------
                _Section(
                  title: '5) Kirim Data/Argumen',
                  child: Column(
                    children: [
                      Text(
                        'Anda bisa mengirim data saat navigasi dan menerimanya di halaman tujuan '
                        'melalui Get.arguments.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => Get.toNamed(
                          Routes.widgetDasar,
                          arguments: {
                            'pesan': 'Halo dari Routing & Navigasi 👋',
                          },
                        ),
                        child: const Text('Get.toNamed(..., arguments: {...})'),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Di halaman tujuan, akses dengan:\n'
                        'final args = Get.arguments; // Map / tipe apa pun',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
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
}

// --- komponen section konsisten dengan halaman lain ---------------------------
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
