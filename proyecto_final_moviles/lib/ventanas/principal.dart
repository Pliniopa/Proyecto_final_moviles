import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/temas/estilo_tintero.dart';
import 'package:proyecto_final_moviles/temas/nocturna.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Map<String, String>> _recommended = const [
    {
      "titulo": "Pinocho",
      "autor": "Carlo Collodi",
      "imagen": "assets/img/imagen1.png",
    },
    {
      "titulo": "Pinocho",
      "autor": "Carlo Collodi",
      "imagen": "assets/img/imagen1.png",
    },
    {
      "titulo": "Pinocho",
      "autor": "Carlo Collodi",
      "imagen": "assets/img/imagen1.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinteroBackground(
        image: fondoGeneral,
        opacity: 0.34,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(26, 22, 26, 92),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: TinteroLogo(width: 95)),
                    const SizedBox(height: 6),
                    const Text(
                      "¡Hola, Plinio!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      "Que bueno verte de nuevo",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        hintText: "Busca libros,generos...",
                        hintStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.22),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Recomendado para ti",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (final book in _recommended)
                          _RecommendedBook(book: book),
                      ],
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      "Explorar por género",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        const _GenreChip(text: "Fantasia"),
                        const SizedBox(width: 20),
                        const _GenreChip(text: "Fantasia"),
                        const SizedBox(width: 20),
                        const _GenreChip(text: "Fantasia"),
                        const Spacer(),
                        Icon(
                          Icons.play_arrow_rounded,
                          color: tinteroField.withValues(alpha: 0.42),
                          size: 48,
                        ),
                      ],
                    ),
                    const SizedBox(height: 54),
                    Container(
                      height: 176,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: tinteroPanel,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const BookCover(
                            image: "assets/img/imagen8.png",
                            width: 94,
                            height: 126,
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Literatura\nDorling Kindersley",
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.72),
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  "50% COMPLETADO",
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.72),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TinteroButton(
                            text: "Continuar\nleyendo",
                            width: 92,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const BotonLuna(),
              const TinteroBottomNav(currentIndex: -1),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecommendedBook extends StatelessWidget {
  final Map<String, String> book;

  const _RecommendedBook({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 14),
      decoration: BoxDecoration(
        color: tinteroPanel,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(image: book["imagen"]!, width: 78, height: 110),
          const SizedBox(height: 12),
          Text(
            book["titulo"]!,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.74),
              fontSize: 12,
            ),
          ),
          Text(
            book["autor"]!,
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _GenreChip extends StatelessWidget {
  final String text;

  const _GenreChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: tinteroPanel,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.58),
          fontSize: 12,
        ),
      ),
    );
  }
}
