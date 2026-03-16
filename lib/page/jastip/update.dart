import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateJastip extends StatefulWidget {
  final String id;

  const UpdateJastip({super.key, required this.id});

  @override
  State<UpdateJastip> createState() => _UpdateJastipState();
}

class _UpdateJastipState extends State<UpdateJastip> {
  final supabase = Supabase.instance.client;

  final nama = TextEditingController();
  final lokasi = TextEditingController();
  final pemesan = TextEditingController();
  final harga = TextEditingController();

  bool isLoading = true;

  Future<void> getData() async {
    try {
      final data = await supabase
          .from('jastip')
          .select()
          .eq('id', widget.id)
          .single();

      nama.text = data['nama_barang'];
      lokasi.text = data['lokasi_beli'];
      pemesan.text = data['nama_pemesan'];
      harga.text = data['harga'].toString();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      ("Error: $e");
    }
  }

  Future<void> updateData() async {
    try {
      await supabase
          .from('jastip')
          .update({
            'nama_barang': nama.text,
            'lokasi_beli': lokasi.text,
            'nama_pemesan': pemesan.text,
            'harga': int.parse(harga.text),
          })
          .eq('id', widget.id);

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Sukses")));

      Navigator.pop(context);
    } catch (e) {
      (e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    nama.dispose();
    lokasi.dispose();
    pemesan.dispose();
    harga.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),

        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purple],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),

          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(width: 10),
                  const Icon(Icons.shopping_bag, color: Colors.white),

                  const SizedBox(width: 10),

                  const Text(
                    "Update Jastip",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),

            child: Column(
              children: [
                TextField(
                  controller: nama,
                  decoration: InputDecoration(
                    labelText: "Nama Barang",
                    prefixIcon: const Icon(Icons.shopping_bag),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: lokasi,
                  decoration: InputDecoration(
                    labelText: "Lokasi Beli",
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: pemesan,
                  decoration: InputDecoration(
                    labelText: "Nama Pemesan",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: harga,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                  decoration: InputDecoration(
                    labelText: "Harga",
                    prefixIcon: const Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: 120,
                  height: 42,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),

                    onPressed: updateData,

                    child: const Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
