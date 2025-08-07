import 'dart:math';
import 'package:flutter/material.dart';

class InteractiveParticle {
  Offset position;
  Offset velocity;
  double size;
  Color color;
  double opacity;
  double rotationSpeed;
  double currentRotation;
  double pulsePhase;

  InteractiveParticle({
    required this.position,
    required this.velocity,
    required this.size,
    required this.color,
    required this.opacity,
    required this.rotationSpeed,
    this.currentRotation = 0,
    this.pulsePhase = 0,
  });

  void update(Size screenSize, Offset? mousePosition) {
    // Mouse attraction effect
    if (mousePosition != null) {
      final distance = (mousePosition - position).distance;
      if (distance < 150) {
        final attraction = (mousePosition - position) * 0.02;
        velocity += attraction;
      }
    }

    position += velocity;
    velocity *= 0.98; // Damping
    currentRotation += rotationSpeed;
    pulsePhase += 0.05;

    // Boundary collision
    if (position.dx < 0 || position.dx > screenSize.width) {
      velocity = Offset(-velocity.dx * 0.8, velocity.dy);
    }
    if (position.dy < 0 || position.dy > screenSize.height) {
      velocity = Offset(velocity.dx, -velocity.dy * 0.8);
    }

    position = Offset(
      position.dx.clamp(0, screenSize.width),
      position.dy.clamp(0, screenSize.height),
    );
  }
}

class ParticleBackground extends StatefulWidget {
  final int numberOfParticles;
  final Color color;

  const ParticleBackground({
    Key? key,
    this.numberOfParticles = 120,
    this.color = const Color(0xFF00BCD4),
  }) : super(key: key);

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<InteractiveParticle> particles = [];
  Offset? mousePosition;
  final Random random = Random();

  final List<Color> _gradientColors = [
    const Color(0xFF00BCD4), // Cyan
    const Color(0xFF40E0D0), // Turquoise
    const Color(0xFF64FFDA), // Cyan accent
    const Color(0xFF26C6DA), // Light cyan
    const Color(0xFF00ACC1), // Dark cyan
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeParticles();
    });

    _controller.addListener(() {
      setState(() {
        for (var particle in particles) {
          particle.update(MediaQuery.of(context).size, mousePosition);
        }
      });
    });
  }

  void _initializeParticles() {
    final size = MediaQuery.of(context).size;
    particles = List.generate(widget.numberOfParticles, (index) {
      return InteractiveParticle(
        position: Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        ),
        velocity: Offset(
          (random.nextDouble() - 0.5) * 2,
          (random.nextDouble() - 0.5) * 2,
        ),
        size: random.nextDouble() * 4 + 2,
        color: _gradientColors[random.nextInt(_gradientColors.length)],
        opacity: random.nextDouble() * 0.6 + 0.2,
        rotationSpeed: (random.nextDouble() - 0.5) * 0.02,
        pulsePhase: random.nextDouble() * 2 * pi,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          mousePosition = event.localPosition;
        });
      },
      onExit: (_) {
        setState(() {
          mousePosition = null;
        });
      },
      child: CustomPaint(
        painter: InteractiveParticlePainter(particles),
        child: Container(),
      ),
    );
  }
}

class InteractiveParticlePainter extends CustomPainter {
  final List<InteractiveParticle> particles;

  InteractiveParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            particle.color.withOpacity(particle.opacity),
            particle.color.withOpacity(0),
          ],
        ).createShader(
          Rect.fromCircle(
            center: particle.position,
            radius: particle.size * 3,
          ),
        )
        ..blendMode = BlendMode.screen;

      // Dynamic pulse effect
      final pulseSize = particle.size * (1 + 0.3 * sin(particle.pulsePhase));

      canvas.drawCircle(particle.position, pulseSize, paint);

      // Add small core
      final corePaint = Paint()
        ..color = Colors.white.withOpacity(particle.opacity * 0.8);
      canvas.drawCircle(particle.position, particle.size * 0.3, corePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
