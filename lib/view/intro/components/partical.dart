import 'dart:math';
import 'package:flutter/material.dart';

class Particle {
  Offset position;
  double size;
  Paint paint;
  Offset direction;

  Particle({
    required this.position,
    required this.size,
    required this.paint,
    required this.direction,
  });

  void move(Size boundary) {
    position += direction;

    if (position.dx > boundary.width || position.dx < 0) {
      direction = Offset(-direction.dx, direction.dy);
    }
    if (position.dy > boundary.height || position.dy < 0) {
      direction = Offset(direction.dx, -direction.dy);
    }
  }
}

class ParticlePainter extends CustomPainter {
  List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      canvas.drawCircle(particle.position, particle.size, particle.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ParticleBackground extends StatefulWidget {
  final int numberOfParticles;
  final Color color;

  const ParticleBackground({
    Key? key,
    this.numberOfParticles = 100,
    this.color = Colors.cyanAccent,
  }) : super(key: key);

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late AnimationController controller;
  Size? screenSize;
  final Random random = Random();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..addListener(() {
      if (mounted) {
        updateParticles();
      }
    });
    controller.repeat();

    // Delay initialization until after first frame (to get MediaQuery)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      setState(() {
        screenSize = size;
        initParticles();
      });
    });
  }

  void initParticles() {
    if (screenSize == null) return;
    particles = List.generate(widget.numberOfParticles, (index) {
      final pos = Offset(
        random.nextDouble() * screenSize!.width,
        random.nextDouble() * screenSize!.height,
      );
      final size = random.nextDouble() * 3 + 1; // size 1 to 4
      final paint = Paint()
        ..color = widget.color.withOpacity(0.3 + random.nextDouble() * 0.7);
      final direction = Offset(
        (random.nextDouble() - 0.5) * 0.5,
        (random.nextDouble() - 0.5) * 0.5,
      );
      return Particle(position: pos, size: size, paint: paint, direction: direction);
    });
  }

  void updateParticles() {
    if (screenSize == null || particles.isEmpty) return;

    for (var particle in particles) {
      particle.move(screenSize!);
    }
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (screenSize == null || particles.isEmpty) {
      // Show empty container while initializing
      return const SizedBox.shrink();
    }

    return CustomPaint(
      painter: ParticlePainter(particles),
      child: Container(),
    );
  }
}

