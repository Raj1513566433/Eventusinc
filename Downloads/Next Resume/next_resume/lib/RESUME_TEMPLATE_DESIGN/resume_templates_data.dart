import 'package:flutter/material.dart';

class ResumeTemplateData {
  final String name;
  final String description;
  final ResumeTemplateType type;
  final Color primaryColor;
  final Color secondaryColor;

  ResumeTemplateData({
    required this.name,
    required this.description,
    required this.type,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

enum ResumeTemplateType {
  modern,
  professional,
  creative,
  minimal,
  executive,
  tech,
  designer,
  academic,
  simple,
  colorful,
  elegant,
  bold,
}

class ResumeTemplates {
  static List<ResumeTemplateData> getAllTemplates() {
    return [
      ResumeTemplateData(
        name: 'Modern Professional',
        description: 'Clean and contemporary design',
        type: ResumeTemplateType.modern,
        primaryColor: const Color(0xFF1CDB02),
        secondaryColor: const Color(0xFF0A8F00),
      ),
      ResumeTemplateData(
        name: 'Classic Professional',
        description: 'Traditional corporate style',
        type: ResumeTemplateType.professional,
        primaryColor: const Color(0xFF2C3E50),
        secondaryColor: const Color(0xFF34495E),
      ),
      ResumeTemplateData(
        name: 'Creative Designer',
        description: 'Bold and artistic layout',
        type: ResumeTemplateType.creative,
        primaryColor: const Color(0xFFE74C3C),
        secondaryColor: const Color(0xFFC0392B),
      ),
      ResumeTemplateData(
        name: 'Minimal Elegance',
        description: 'Simple and sophisticated',
        type: ResumeTemplateType.minimal,
        primaryColor: const Color(0xFF95A5A6),
        secondaryColor: const Color(0xFF7F8C8D),
      ),
      ResumeTemplateData(
        name: 'Executive Style',
        description: 'Premium professional look',
        type: ResumeTemplateType.executive,
        primaryColor: const Color(0xFF8E44AD),
        secondaryColor: const Color(0xFF9B59B6),
      ),
      ResumeTemplateData(
        name: 'Tech Innovator',
        description: 'Modern tech industry design',
        type: ResumeTemplateType.tech,
        primaryColor: const Color(0xFF3498DB),
        secondaryColor: const Color(0xFF2980B9),
      ),
      ResumeTemplateData(
        name: 'Creative Artist',
        description: 'Colorful and expressive',
        type: ResumeTemplateType.designer,
        primaryColor: const Color(0xFFF39C12),
        secondaryColor: const Color(0xFFE67E22),
      ),
      ResumeTemplateData(
        name: 'Academic Scholar',
        description: 'Formal academic layout',
        type: ResumeTemplateType.academic,
        primaryColor: const Color(0xFF16A085),
        secondaryColor: const Color(0xFF1ABC9C),
      ),
      ResumeTemplateData(
        name: 'Simple & Clean',
        description: 'Straightforward design',
        type: ResumeTemplateType.simple,
        primaryColor: const Color(0xFF34495E),
        secondaryColor: const Color(0xFF2C3E50),
      ),
      ResumeTemplateData(
        name: 'Vibrant Colors',
        description: 'Eye-catching colorful design',
        type: ResumeTemplateType.colorful,
        primaryColor: const Color(0xFFE91E63),
        secondaryColor: const Color(0xFFC2185B),
      ),
      ResumeTemplateData(
        name: 'Elegant Pro',
        description: 'Refined and polished',
        type: ResumeTemplateType.elegant,
        primaryColor: const Color(0xFF607D8B),
        secondaryColor: const Color(0xFF455A64),
      ),
      ResumeTemplateData(
        name: 'Bold Impact',
        description: 'Strong and powerful design',
        type: ResumeTemplateType.bold,
        primaryColor: const Color(0xFFD32F2F),
        secondaryColor: const Color(0xFFC62828),
      ),
    ];
  }
}