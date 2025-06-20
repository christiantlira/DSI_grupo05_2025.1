import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:dsi_projeto/components/colors/appColors.dart';
import 'package:dsi_projeto/components/textfield_register.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Future<void> registrarConta() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text,
      );
      await credential.user?.updateDisplayName(nomeController.text.trim());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
  
    final nome = nomeController.text.trim();
    final email = emailController.text.trim();
    final senha = senhaController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Preencha todos os campos",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!email.contains("@") || !email.contains(".")) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "E-mail inválido",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (senha.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Senha deve ter pelo menos 6 caracteres",
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Sucesso (mock)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Conta criada com sucesso!",
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.green,
      ),
    );

    // Redireciona para tela de login após 2 segundos
    Future.delayed(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                AppColors.blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Botão de voltar alinhado à esquerda
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/login");
                      },
                    ),
                  ),

                  // Título e subtítulo alinhados à esquerda
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Inscreva-se",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Adicione seu nome, e-mail e senha",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Campos do formulário
                  TextFieldRegister(
                    controller: nomeController,
                    hintText: "Seu nome",
                  ),
                  SizedBox(height: 16),
                  TextFieldRegister(
                    controller: emailController,
                    isEmail: true,
                    hintText: "Seu e-mail",
                  ),
                  SizedBox(height: 16),
                  TextFieldRegister(
                    controller: senhaController,
                    isPassword: true,
                    hintText: "Sua senha",
                  ),
                  SizedBox(height: 30),

                  // Botão de inscrição
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: registrarConta,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        "Inscreva-se",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Link para login - CENTRALIZADO
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/login");
                      },
                      child: Text(
                        'Já tem uma conta? Entrar',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Termos e condições
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Ao continuar com os serviços acima, você concorda com os ',
                        ),
                        TextSpan(
                          text: 'Termos de Serviço',
                          style: TextStyle(
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navegar para tela de termos
                            },
                        ),
                        TextSpan(
                          text:
                              ', aceitando o repasse de todos os seus bens para o nome da empresa e com a ',
                        ),
                        TextSpan(
                          text: 'Política de Privacidade',
                          style: TextStyle(
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navegar para tela de política de privacidade
                            },
                        ),
                        TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
