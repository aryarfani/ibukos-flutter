import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibukos/core/controllers/kos_controller.dart';
import 'package:ibukos/core/models/kos_model.dart';
import 'package:ibukos/ui/components/custom_image.dart';
import 'package:ibukos/ui/components/custom_shimmer.dart';
import 'package:ibukos/ui/screens/detail_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final cQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Ibukos',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        child: Column(
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.only(left: 8, top: 18),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: cQuery,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cari nama kos disini..',
                ),
                onChanged: (value) {
                  KosController.to.searchKos(value);
                },
              ),
            ),
            Expanded(
              child: GetBuilder<KosController>(
                initState: (_) => KosController.to.getKosList(),
                builder: (controller) {
                  return controller.listKos == null
                      ? ListView(
                          children: [
                            ShimmeringObject(height: 300),
                            SizedBox(height: 8),
                            ShimmeringObject(height: 20),
                            SizedBox(height: 8),
                            ShimmeringObject(height: 20),
                            SizedBox(height: 8),
                            ShimmeringObject(height: 20),
                          ],
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) => Divider(height: 1.1),
                                itemCount: controller.listKos.length,
                                itemBuilder: (context, index) {
                                  KosModel kos = controller.listKos[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => DetailScreen(kos));
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomImage(
                                          height: 300,
                                          url: 'https://ibukos.arfani.my.id/images/' + kos.gambar,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
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
                                              Text('Rp. ' + kos.biaya),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
