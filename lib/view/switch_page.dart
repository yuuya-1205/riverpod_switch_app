import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchPage extends ConsumerWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = false;
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'enabled',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,

                    /// 使用できない場合はトーンダウンしているように見せたいのでグレーで表示
                    /// 使用できる場合は黒にする
                    color: isEnabled ? Colors.black : Colors.grey[400],
                  ),
                ),
                Spacer(),
                Switch(value: isEnabled, onChanged: (value) {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
