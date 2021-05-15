import 'package:flutter/material.dart';
import 'package:ibukos/core/models/kos_model.dart';
import 'package:ibukos/ui/components/custom_image.dart';

class DetailScreen extends StatelessWidget {
  final KosModel kos;
  DetailScreen(this.kos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(
            kos.nama,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              height: 300,
              url: 'http://192.168.0.108/php-vanilla/kampus/ibukos/images/' + kos.gambar,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kos.nama,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(kos.alamat),
                      SizedBox(height: 24),
                    ],
                  ),
                  Spacer(),
                  Text('Rp. ' + kos.biaya),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Kost ${kos.nama} • Kos MamiRooms telah bertansformasi menjadi Singgahsini • Buruan pesan sebelum kehabisan! Harga berlaku HANYA di transaksi pertama • AC mulai tersedia 30 November 2020 • Ada deposit • Kos yang sangat strategis dekat dengan RSU Gramedika 10 (4.9 km) • Super Indo Kaliurang (3.3 km) • New Social Agency (1.2 km)  ',
                ),
              ),
            ),
          ],
        ));
  }
}
