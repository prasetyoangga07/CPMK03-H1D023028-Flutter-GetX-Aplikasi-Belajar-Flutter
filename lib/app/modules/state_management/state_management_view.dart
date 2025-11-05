import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_bottom_nav.dart';

class CounterController extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
  void reset() => count.value = 0;
}

class StateManagementView extends StatelessWidget {
  const StateManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final c = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: const Text('State Management (GetX)')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.manage_accounts, size: 80, color: cs.primary),
                const SizedBox(height: 16),
                Text(
                  'State Management (GetX)',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Dalam Flutter, "state" adalah data yang memengaruhi tampilan aplikasi. '
                  'Dengan GetX, kita bisa membuat data menjadi *reaktif* menggunakan `.obs`, '
                  'dan memperbarui tampilan otomatis dengan `Obx()`.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // --- Contoh Praktik Counter ---
                _Section(
                  title: 'Contoh Praktik: Counter Reaktif',
                  child: Column(
                    children: [
                      Obx(
                        () => Text(
                          'Angka: ${c.count}',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: cs.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          FilledButton.icon(
                            onPressed: c.increment,
                            icon: const Icon(Icons.add),
                            label: const Text('Tambah'),
                          ),
                          OutlinedButton.icon(
                            onPressed: c.reset,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Reset'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Setiap kali tombol "Tambah" ditekan, nilai count berubah, '
                        'dan teks di atas ikut diperbarui secara otomatis karena GetX '
                        'memantau perubahan state menggunakan Rx.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

                // --- Penjelasan tambahan ---
                _Section(
                  title: 'Mengapa GetX untuk State Management?',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bullet(
                        context,
                        '✔ Mudah digunakan tanpa banyak boilerplate.',
                      ),
                      _bullet(
                        context,
                        '✔ Reactive: UI langsung update saat data berubah.',
                      ),
                      _bullet(
                        context,
                        '✔ Terintegrasi dengan navigasi & dependency injection.',
                      ),
                      _bullet(
                        context,
                        '✔ Ringan dan cepat dibandingkan banyak state manager lain.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bullet(BuildContext context, String text) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
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
}

// --- komponen section seragam dengan halaman lain ---
class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceVariant.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
