import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _cpfOrCnpjController;
  late final TextEditingController _passwordController;

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();

    _cpfOrCnpjController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _cpfOrCnpjController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _register() {
    // Descomente esse código para navegar para `/auth/register` através do botão entrar
    // Navigator.pushNamed(context, '/auth/register');

    if (_formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Center(child: Image(image: CooImages.cooBrand)),
                const SizedBox(height: 60),
                Center(
                  child: Text(
                    'Login',
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 56,
                      color: colorsTheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Informe o seu CPF/CNPJ',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorsTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Insira seu CPF/CNPJ',
                        ),
                        validator: _validatorEmpty('CPF/CNPJ não pode está vazio'),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Senha',
                        style: textTheme.titleMedium?.copyWith(
                          color: colorsTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Insira sua senha',
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: _validatorEmpty('Senha não pode está vazia'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 56,
                  child: CooButton.primary(
                    label: 'Entrar',
                    onPressed: _register,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? Function(String?)? _validatorEmpty(String message) {
    return (value) {
      if (value == null || value.isEmpty) {
        return message;
      }
      return null;
    };
  }
}
