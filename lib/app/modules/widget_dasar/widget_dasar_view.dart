import 'package:flutter/material.dart';
import '../../widgets/app_bottom_nav.dart';

class WidgetDasarView extends StatelessWidget {
  const WidgetDasarView({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme; // ambil palet warna dari tema

    return Scaffold(
      appBar: AppBar(title: const Text('Widget Dasar')),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.widgets, size: 72, color: cs.primary),
                const SizedBox(height: 16),

                // Judul halaman
                Text(
                  'Widget Dasar',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // Deskripsi
                Text(
                  'Pengenalan widget penting di Flutter: Text, Container, Row, Column, ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // --- TEXT & ICON -------------------------------------------------
                _Section(
                  title: 'Text & Icon',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Ini judul menggunakan Theme.headlineSmall',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ini paragraf menggunakan Theme.bodyMedium untuk menjaga konsistensi.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.school, color: cs.primary, size: 28),
                          const SizedBox(width: 12),
                          Icon(Icons.code, color: cs.secondary, size: 28),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.flutter_dash,
                            color: cs.tertiary,
                            size: 28,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // --- CONTAINER & ROW --------------------------------------------
                _Section(
                  title: 'Container, Row & Column',
                  child: Column(
                    children: [
                      Text(
                        'Contoh Row yang berisi 3 Container berwarna sesuai skema tema:',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _colorBox(cs.primary),
                          const SizedBox(width: 8),
                          _colorBox(cs.secondary),
                          const SizedBox(width: 8),
                          _colorBox(cs.tertiary),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: cs.surfaceVariant,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Container penuh lebar dengan background surfaceVariant '
                          'yang konsisten dengan Material 3.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),

                // --- LISTTILE (dengan Card) -------------------------------------
                _Section(
                  title: 'ListTile (dalam Card)',
                  child: Card(
                    color: cs.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: cs.outlineVariant),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.info, color: cs.primary),
                      title: const Text(
                        'ListTile mengikuti tipografi & warna tema',
                      ),
                      subtitle: Text(
                        'Bagus untuk daftar materi atau item navigasi.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: cs.onSurfaceVariant,
                      ),
                      onTap: () {}, // contoh
                    ),
                  ),
                ),

                // --- BUTTON ------------------------------------------------------
                _Section(
                  title: 'Button',
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: () {},
                        child: const Text('FilledButton'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('ElevatedButton'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('OutlinedButton'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('TextButton'),
                      ),
                    ],
                  ),
                ),

                // --- FOOTER ------------------------------------------------------
                const SizedBox(height: 8),
                Text(
                  'Semua contoh di atas menggunakan ThemeData dari aplikasi ini.',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // kotak warna tematik
  Widget _colorBox(Color color) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// ------- widget section berbingkai rapi ---------------------------------------
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
        color: cs.surfaceVariant.withOpacity(.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
