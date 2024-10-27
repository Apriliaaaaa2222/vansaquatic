import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // Logo kiri atas dengan rotasi
              Align(
                alignment: Alignment.topLeft,
                child: Opacity(
                  opacity: 0.35, // Opacity 35%
                  child: Transform(
                    transform: Matrix4.rotationY(
                        3.14159), // Membalik logo secara horizontal
                    alignment: Alignment.center,
                    child: Image.asset(
                      'lib/app/assets/logo-polos.png', // Path logo Anda
                      height: 100,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Nama TextField
              _buildTextField(
                label: 'Nama',
                onChanged: (value) => controller.nama.value = value,
                icon: Icons.person,
              ),
              SizedBox(height: 20),
              // Alamat TextField
              _buildTextField(
                label: 'Alamat',
                onChanged: (value) => controller.alamat.value = value,
                icon: Icons.home,
              ),
              SizedBox(height: 20),
              // No. Telp TextField
              _buildTextField(
                label: 'No. Telp',
                onChanged: (value) => controller.noTelp.value = value,
                icon: Icons.phone,
              ),
              SizedBox(height: 20),
              // Username TextField
              _buildTextField(
                label: 'Username',
                onChanged: (value) => controller.username.value = value,
                icon: Icons.person,
              ),
              SizedBox(height: 20),
              // Password TextField
              _buildTextField(
                label: 'Password',
                onChanged: (value) => controller.password.value = value,
                icon: Icons.lock,
                isPassword: true,
              ),
              SizedBox(height: 20),
              // Register Button
              ElevatedButton(
                onPressed: () {
                  controller
                      .register(); // Arahkan ke halaman login setelah register
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Logo kanan bawah
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: 0.35, // Opacity 35%
                  child: Image.asset(
                    'lib/app/assets/logo-polos.png', // Path logo Anda
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun TextField
  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            onChanged: onChanged,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: '$label ...',
              border: InputBorder.none,
              prefixIcon: Icon(icon, size: 30.0),
              contentPadding: EdgeInsets.symmetric(vertical: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
