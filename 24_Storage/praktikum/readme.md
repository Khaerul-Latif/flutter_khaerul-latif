# (24) Storages
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Task
### Task 01 dan Task 02
**Buatlah halaman Register dan halaman Home, dengan ketentuan sebagai berikut:**
1. Pada halaman Register, buat tombol Register dan 4 kolom untuk nama, email, nomor telepon, dan password.
```dart
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter at least 4 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (email) {
                  if (email != null && !EmailValidator.validate(email)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: _numberController,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                ),
                validator: (value) {
                  if (value != null && value.length < 12) {
                    return 'Enter at least 12 characters';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                obscureText: !_passwordVisible && !_colorChange,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: _colorChange ? Colors.grey : Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                        _colorChange = !_colorChange;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value != null && value.length < 5) {
                    return 'Enter min. 5 characters';
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
```
2. Saat menekan tombol Register, simpan data email (String), nama (String) dan isLogin (boolean/bool) ke dalam shared preference dan navigasi ke halaman Home.

```dart
  late SharedPreferences loginData;
  String name = '';
  String email = '';

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      name = loginData.getString('name') ?? '';
      email = loginData.getString('email') ?? '';
    });
  }

  @override
  void initState() {
    initial();
    super.initState();
  }
```

```dart
              ElevatedButton(
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();
                  String name = _nameController.text;
                  String email = _emailController.text;
                  if (isValidForm) {
                    logindata.setBool('login', false);
                    logindata.setString('name', name);
                    logindata.setString('email', email);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  }
                },
                child: const Text('Register'),
              ),
```
3. Pada halaman Home, buat teks untuk menampilkan nama dan email & buat tombol loq out.
```dart
      body: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello, ${name}',
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 71, 71, 71)),
            ),
            Text(
              email,
              style:
                  TextStyle(fontSize: 20, color: Color.fromARGB(255, 71, 71, 71)),
            ),
            ElevatedButton(
              onPressed: () {
                loginData.setBool('login', true);
                loginData.remove('name');
                loginData.remove('email');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
```
4. Saat menekan tombol rog out, hapus semua isi di shared preference & navigasi ke halaman Register.
```dart
            loginData.remove('name');
                loginData.remove('email');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
```
5. Gunakan state management provider & bloc untuk menampilkan nama dan email di halaman Home.

**saya masih bingung menggunakan state provider & bloc pada task ini pak**

Hasil dari Task 01 & Task 02

![img Task01 & Task02](/24_Storage/screenshots/tasks(1).gif)

![img Task01 & Task02](/24_Storage/screenshots/tasks(2).gif)
