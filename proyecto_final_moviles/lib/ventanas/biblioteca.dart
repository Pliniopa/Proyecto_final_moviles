import 'package:flutter/material.dart';
import 'package:proyecto_final_moviles/temas/estilo_tintero.dart';

class Biblioteca extends StatelessWidget {
  const Biblioteca({super.key});

  static const List<Map<String, String>> continuar = [
    {
      "titulo": "Pinocho",
      "autor": "Carlo Collodi",
      "imagen": "assets/img/imagen1.png",
      "descripcion": "pinocho se escapo y el carpintero se lo trago la ballena",
    },
    {
      "titulo": "Aquel bosque de magia",
      "autor": "Anónimo",
      "imagen": "assets/img/imagen5.png",
      "descripcion":
          "Un bosque encantado lleno de secretos y criaturas mágicas.",
    },
    {
      "titulo": "El Bosque Mágico",
      "autor": "Elena Estévez",
      "imagen": "assets/img/imagen6.png",
      "descripcion": "Una aventura luminosa entre árboles antiguos.",
    },
    {
      "titulo": "El zorro en el bosque",
      "autor": "Salma Duque",
      "imagen": "assets/img/imagen7.png",
      "descripcion": "Un pequeño zorro descubre el valor de su hogar.",
    },
    {
      "titulo": "Literatura",
      "autor": "Dorling Kindersley",
      "imagen": "assets/img/imagen8.png",
      "descripcion": "Un recorrido por historias, autores y mundos literarios.",
    },
  ];

  static const List<Map<String, String>> nuevos = [
    {
      "titulo": "Historias de terror",
      "autor": "Bernardo Hichado",
      "imagen": "assets/img/imagen3.png",
      "descripcion": "Relatos oscuros para leer con la luz encendida.",
    },
    {
      "titulo": "Crea tu portada de libro",
      "autor": "Gabriel L. Swift",
      "imagen": "assets/img/imagen4.png",
      "descripcion": "Ideas para construir portadas memorables.",
    },
    {
      "titulo": "Simón",
      "autor": "Miqui Otero",
      "imagen": "assets/img/imagen2.png",
      "descripcion": "Una historia urbana con aventuras inesperadas.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinteroBackground(
        image: fondoPerfil,
        opacity: 0.58,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 62, 0, 92),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TinteroLogo(width: 72),
                          CircleAvatar(
                            radius: 34,
                            backgroundColor: Color(0xFFD4EFF8),
                            backgroundImage: AssetImage(tinteroAvatar),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    const Text(
                      "Continuar leyendo",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(height: 28),
                    _BookGrid(books: continuar, includeAdd: true),
                    const SizedBox(height: 80),
                    const Text(
                      "Lo nuevo en Tintero",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 154,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: nuevos.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 30),
                        itemBuilder: (context, index) {
                          final book = nuevos[index];
                          return GestureDetector(
                            onTap: () => _openBook(context, book),
                            child: BookCover(
                              image: book["imagen"]!,
                              width: 120,
                              height: 154,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const TinteroBottomNav(currentIndex: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookGrid extends StatelessWidget {
  final List<Map<String, String>> books;
  final bool includeAdd;

  const _BookGrid({required this.books, this.includeAdd = false});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 34,
      children: [
        for (final book in books)
          GestureDetector(
            onTap: () => _openBook(context, book),
            child: BookCover(image: book["imagen"]!, width: 120, height: 154),
          ),
        if (includeAdd)
          Container(
            width: 120,
            height: 154,
            alignment: Alignment.center,
            color: tinteroDeep,
            child: const Icon(Icons.add, color: Colors.white, size: 38),
          ),
      ],
    );
  }
}

void _openBook(BuildContext context, Map<String, String> book) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetalleBloque(
        titulo: book["titulo"]!,
        descripcion: book["descripcion"]!,
        imagen: book["imagen"]!,
        autor: book["autor"]!,
      ),
    ),
  );
}

class DetalleBloque extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String imagen;
  final String autor;

  const DetalleBloque({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.autor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinteroBackground(
        image: fondoGeneral,
        opacity: 0.36,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 46, 22, 92),
                child: Column(
                  children: [
                    const TinteroLogo(width: 105),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: tinteroPanel,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: BookCover(
                            image: imagen,
                            width: 88,
                            height: 164,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titulo,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Autor"$autor"',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 28),
                              const Text(
                                "Sipnosis",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                  color: tinteroPanel,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Text(
                                  descripcion,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(30, 32, 30, 34),
                      decoration: BoxDecoration(
                        color: tinteroPanel,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "$titulo es una historia pensada para lectores que disfrutan mundos imaginativos, personajes memorables y aventuras que mezclan fantasia, aprendizaje y curiosidad.",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    TinteroButton(
                      text: "Continua Leyendo",
                      width: 258,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const TinteroBottomNav(currentIndex: 0),
            ],
          ),
        ),
      ),
    );
  }
}
