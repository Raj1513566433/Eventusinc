import 'package:flutter/material.dart';
import 'dart:ui';

class ResumeTemplatePage extends StatefulWidget {
  final int templateIndex;
  
  const ResumeTemplatePage({
    super.key,
    required this.templateIndex,
  });

  @override
  State<ResumeTemplatePage> createState() => _ResumeTemplatePageState();
}

class _ResumeTemplatePageState extends State<ResumeTemplatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  
  List<Map<String, String>> _experiences = [];
  List<Map<String, String>> _education = [];
  List<String> _skills = [];
  
  bool _isEditing = false;

  // Different color schemes for templates
  Color get primaryColor {
    switch (widget.templateIndex) {
      case 0: return const Color(0xFF1CDB02); // Green - Modern
      case 1: return const Color(0xFF2C3E50); // Dark Blue - Professional
      case 2: return const Color(0xFFE74C3C); // Red - Creative
      case 3: return const Color(0xFF95A5A6); // Gray - Minimal
      case 4: return const Color(0xFF8E44AD); // Purple - Executive
      case 5: return const Color(0xFF3498DB); // Blue - Tech
      case 6: return const Color(0xFFF39C12); // Orange - Designer
      case 7: return const Color(0xFF16A085); // Teal - Academic
      case 8: return const Color(0xFF34495E); // Dark Gray - Simple
      case 9: return const Color(0xFFE91E63); // Pink - Colorful
      case 10: return const Color(0xFF607D8B); // Blue Gray - Elegant
      case 11: return const Color(0xFFD32F2F); // Red - Bold
      default: return const Color(0xFF1CDB02);
    }
  }

  Color get secondaryColor => primaryColor.withOpacity(0.7);

  @override
  void initState() {
    super.initState();
    _loadDefaultData();
  }

  void _loadDefaultData() {
    _nameController.text = "Your Name";
    _titleController.text = "Professional Title";
    _emailController.text = "email@example.com";
    _phoneController.text = "+1 234 567 8900";
    _addressController.text = "City, Country";
    _summaryController.text = "Write a brief summary about yourself, your experience, and what you bring to the table.";
    
    _experiences = [
      {
        'position': 'New Position',
        'company': 'Company Name',
        'duration': '2024 - Present',
        'description': 'Add description here',
      },
    ];
    
    _education = [
      {
        'degree': 'Bachelor of Science',
        'institution': 'University Name',
        'year': '2020',
      },
    ];
    
    _skills = ['Leadership', 'Communication', 'Project Management', 'Problem Solving'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor.withOpacity(0.1),
              Colors.white,
              primaryColor.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: _buildResumeByType(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingButtons(),
    );
  }

  Widget _buildAppBar() {
    String templateName = _getTemplateName();
    
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.black87),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  templateName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  _getTemplateDescription(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: _isEditing 
                        ? primaryColor.withOpacity(0.6)
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isEditing ? Icons.save : Icons.edit,
                        color: Colors.black87,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isEditing ? 'Save' : 'Edit',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTemplateName() {
    List<String> names = [
      'Modern Professional',
      'Classic Professional',
      'Creative Designer',
      'Minimal Elegance',
      'Executive Style',
      'Tech Innovator',
      'Creative Artist',
      'Academic Scholar',
      'Simple & Clean',
      'Vibrant Colors',
      'Elegant Pro',
      'Bold Impact',
    ];
    return names[widget.templateIndex];
  }

  String _getTemplateDescription() {
    List<String> descriptions = [
      'Clean and contemporary design',
      'Traditional corporate style',
      'Bold and artistic layout',
      'Simple and sophisticated',
      'Premium professional look',
      'Modern tech industry design',
      'Colorful and expressive',
      'Formal academic layout',
      'Straightforward design',
      'Eye-catching colorful design',
      'Refined and polished',
      'Strong and powerful design',
    ];
    return descriptions[widget.templateIndex];
  }

  Widget _buildResumeByType() {
    switch (widget.templateIndex) {
      case 0:
        return _buildModernTemplate();
      case 1:
        return _buildProfessionalTemplate();
      case 2:
        return _buildCreativeTemplate();
      case 3:
        return _buildMinimalTemplate();
      case 4:
        return _buildExecutiveTemplate();
      case 5:
        return _buildTechTemplate();
      case 6:
        return _buildDesignerTemplate();
      case 7:
        return _buildAcademicTemplate();
      case 8:
        return _buildSimpleTemplate();
      case 9:
        return _buildColorfulTemplate();
      case 10:
        return _buildElegantTemplate();
      case 11:
        return _buildBoldTemplate();
      default:
        return _buildModernTemplate();
    }
  }

  // Template 1: Modern Professional - Green header
  Widget _buildModernTemplate() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, secondaryColor],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, size: 50, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  _buildEditableField(_nameController, 'Name', 28, FontWeight.bold, Colors.white),
                  const SizedBox(height: 8),
                  _buildEditableField(_titleController, 'Title', 18, FontWeight.normal, Colors.white.withOpacity(0.9)),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactSection(),
                  const SizedBox(height: 24),
                  _buildDivider(),
                  const SizedBox(height: 24),
                  _buildSummarySection(),
                  const SizedBox(height: 24),
                  _buildDivider(),
                  const SizedBox(height: 24),
                  _buildExperienceSection(),
                  const SizedBox(height: 24),
                  _buildDivider(),
                  const SizedBox(height: 24),
                  _buildEducationSection(),
                  const SizedBox(height: 24),
                  _buildDivider(),
                  const SizedBox(height: 24),
                  _buildSkillsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Template 2: Professional - Traditional
  Widget _buildProfessionalTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          _buildEditableField(_nameController, 'Name', 32, FontWeight.bold, Colors.black87),
          const SizedBox(height: 8),
          _buildEditableField(_titleController, 'Title', 18, FontWeight.normal, primaryColor),
          const SizedBox(height: 16),
          _buildContactSection(),
          const SizedBox(height: 24),
          Container(height: 2, color: primaryColor),
          const SizedBox(height: 24),
          _buildSummarySection(),
          const SizedBox(height: 24),
          _buildExperienceSection(),
          const SizedBox(height: 24),
          _buildEducationSection(),
          const SizedBox(height: 24),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  // Template 3: Creative - Sidebar (This one is good!)
  Widget _buildCreativeTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          Container(
            width: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 50, color: Colors.black54),
                ),
                const SizedBox(height: 30),
                _buildSidebarSection('Contact', [
                  _buildSidebarItem(Icons.email, _emailController.text, Colors.white),
                  _buildSidebarItem(Icons.phone, _phoneController.text, Colors.white),
                  _buildSidebarItem(Icons.location_on, _addressController.text, Colors.white),
                ]),
                const SizedBox(height: 30),
                _buildSidebarSection('Skills', _skills.map((skill) => 
                  _buildSidebarSkill(skill, Colors.white)
                ).toList()),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEditableField(_nameController, 'Name', 28, FontWeight.bold, Colors.black87),
                  const SizedBox(height: 8),
                  _buildEditableField(_titleController, 'Title', 18, FontWeight.normal, primaryColor),
                  const SizedBox(height: 24),
                  _buildSummarySection(),
                  const SizedBox(height: 24),
                  _buildExperienceSection(),
                  const SizedBox(height: 24),
                  _buildEducationSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Template 4: Minimal
  Widget _buildMinimalTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEditableField(_nameController, 'Name', 36, FontWeight.w300, Colors.black87),
          const SizedBox(height: 4),
          _buildEditableField(_titleController, 'Title', 16, FontWeight.normal, Colors.grey),
          const SizedBox(height: 24),
          _buildContactSection(),
          const SizedBox(height: 40),
          _buildSummarySection(),
          const SizedBox(height: 40),
          _buildExperienceSection(),
          const SizedBox(height: 40),
          _buildEducationSection(),
          const SizedBox(height: 40),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  // Template 5: Executive
  Widget _buildExecutiveTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _buildEditableField(_nameController, 'Name', 32, FontWeight.bold, primaryColor),
                const SizedBox(height: 8),
                _buildEditableField(_titleController, 'Title', 18, FontWeight.w500, Colors.black87),
                const SizedBox(height: 16),
                _buildContactSection(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                _buildSummarySection(),
                const SizedBox(height: 32),
                _buildExperienceSection(),
                const SizedBox(height: 32),
                _buildEducationSection(),
                const SizedBox(height: 32),
                _buildSkillsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Template 6: Tech - Dark theme
  Widget _buildTechTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 80,
                color: primaryColor,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableField(_nameController, 'Name', 28, FontWeight.bold, Colors.white),
                    const SizedBox(height: 4),
                    _buildEditableField(_titleController, 'Title', 16, FontWeight.normal, primaryColor),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.email, size: 16, color: primaryColor),
              const SizedBox(width: 8),
              Text(_emailController.text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(width: 24),
              Icon(Icons.phone, size: 16, color: primaryColor),
              const SizedBox(width: 8),
              Text(_phoneController.text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 32),
          _buildSectionTitle('About', Colors.white),
          const SizedBox(height: 12),
          Text(
            _summaryController.text,
            style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
          ),
          const SizedBox(height: 32),
          _buildSectionTitle('Experience', Colors.white),
          const SizedBox(height: 12),
          ..._experiences.map((exp) => _buildDarkExperienceItem(exp)).toList(),
          const SizedBox(height: 32),
          _buildSectionTitle('Education', Colors.white),
          const SizedBox(height: 12),
          ..._education.map((edu) => _buildDarkEducationItem(edu)).toList(),
          const SizedBox(height: 32),
          _buildSectionTitle('Skills', Colors.white),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _skills.map((skill) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryColor.withOpacity(0.5)),
              ),
              child: Text(skill, style: const TextStyle(color: Colors.white, fontSize: 12)),
            )).toList(),
          ),
        ],
      ),
    );
  }

  // Template 7: Designer
  Widget _buildDesignerTemplate() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.1),
            secondaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor, width: 3),
                  ),
                  child: Icon(Icons.person, size: 50, color: primaryColor),
                ),
                const SizedBox(height: 16),
                _buildEditableField(_nameController, 'Name', 28, FontWeight.bold, Colors.black87),
                const SizedBox(height: 8),
                _buildEditableField(_titleController, 'Title', 16, FontWeight.normal, primaryColor),
                const SizedBox(height: 16),
                _buildContactSection(),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSummarySection(),
          const SizedBox(height: 24),
          _buildExperienceSection(),
          const SizedBox(height: 24),
          _buildEducationSection(),
          const SizedBox(height: 24),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  // Template 8: Academic
  Widget _buildAcademicTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildEditableField(_nameController, 'Name', 30, FontWeight.bold, Colors.black87),
          const SizedBox(height: 8),
          _buildEditableField(_titleController, 'Title', 16, FontWeight.normal, Colors.black54),
          const SizedBox(height: 8),
          _buildContactSection(),
          const SizedBox(height: 32),
          const Divider(thickness: 1),
          const SizedBox(height: 32),
          _buildSummarySection(),
          const SizedBox(height: 32),
          _buildEducationSection(),
          const SizedBox(height: 32),
          _buildExperienceSection(),
          const SizedBox(height: 32),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  // Template 9: Simple
  Widget _buildSimpleTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEditableField(_nameController, 'Name', 32, FontWeight.bold, Colors.black87),
          const SizedBox(height: 8),
          _buildEditableField(_titleController, 'Title', 18, FontWeight.normal, Colors.black54),
          const SizedBox(height: 24),
          _buildContactSection(),
          const SizedBox(height: 32),
          _buildSummarySection(),
          const SizedBox(height: 32),
          _buildExperienceSection(),
          const SizedBox(height: 32),
          _buildEducationSection(),
          const SizedBox(height: 32),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  // Template 10: Colorful
  Widget _buildColorfulTemplate() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.2),
            secondaryColor.withOpacity(0.1),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 50, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                _buildEditableField(_nameController, 'Name', 28, FontWeight.bold, Colors.white),
                const SizedBox(height: 8),
                _buildEditableField(_titleController, 'Title', 16, FontWeight.normal, Colors.white.withOpacity(0.9)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildContactSection(),
                const SizedBox(height: 24),
                _buildSummarySection(),
                const SizedBox(height: 24),
                _buildExperienceSection(),
                const SizedBox(height: 24),
                _buildEducationSection(),
                const SizedBox(height: 24),
                _buildSkillsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Template 11: Elegant
  Widget _buildElegantTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 2),
      ),
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor, width: 3),
            ),
            child: Icon(Icons.person, size: 60, color: primaryColor),
          ),
          const SizedBox(height: 20),
          _buildEditableField(_nameController, 'Name', 32, FontWeight.w600, Colors.black87),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: _buildEditableField(_titleController, 'Title', 16, FontWeight.normal, primaryColor),
          ),
          const SizedBox(height: 24),
          _buildContactSection(),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, primaryColor, Colors.transparent],
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildSummarySection(),
          const SizedBox(height: 32),
          _buildExperienceSection(),
          const SizedBox(height: 32),
          _buildEducationSection(),
          const SizedBox(height: 32),
          _buildSkillsSection(),
        ],
      ),
    );
  }

  // Template 12: Bold
  Widget _buildBoldTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _buildEditableField(_nameController, 'Name', 36, FontWeight.w900, Colors.white),
                const SizedBox(height: 8),
                _buildEditableField(_titleController, 'Title', 20, FontWeight.w600, Colors.white.withOpacity(0.9)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                _buildContactSection(),
                const SizedBox(height: 32),
                _buildSummarySection(),
                const SizedBox(height: 32),
                _buildExperienceSection(),
                const SizedBox(height: 32),
                _buildEducationSection(),
                const SizedBox(height: 32),
                _buildSkillsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildEditableField(TextEditingController controller, String label, double fontSize, FontWeight fontWeight, Color color) {
    return _isEditing
        ? TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          )
        : Text(
            controller.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
          );
  }

  Widget _buildContactSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.email, size: 16, color: primaryColor),
        const SizedBox(width: 8),
        Text(_emailController.text, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 24),
        Icon(Icons.phone, size: 16, color: primaryColor),
        const SizedBox(width: 8),
        Text(_phoneController.text, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 24),
        Icon(Icons.location_on, size: 16, color: primaryColor),
        const SizedBox(width: 8),
        Text(_addressController.text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Professional Summary', Colors.black87),
        const SizedBox(height: 12),
        Text(_summaryController.text, style: const TextStyle(fontSize: 14, height: 1.6)),
      ],
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Work Experience', Colors.black87),
            if (_isEditing)
              IconButton(
                icon: Icon(Icons.add_circle, color: primaryColor),
                onPressed: _addExperience,
              ),
          ],
        ),
        const SizedBox(height: 12),
        ..._experiences.asMap().entries.map((entry) => _buildExperienceItem(entry.value, entry.key)).toList(),
      ],
    );
  }

  Widget _buildExperienceItem(Map<String, String> exp, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  exp['position'] ?? '',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (_isEditing)
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () => _removeExperience(index),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(exp['company'] ?? '', style: TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.w500)),
          const SizedBox(height: 2),
          Text(exp['duration'] ?? '', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          const SizedBox(height: 8),
          Text(exp['description'] ?? '', style: const TextStyle(fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Education', Colors.black87),
            if (_isEditing)
              IconButton(
                icon: Icon(Icons.add_circle, color: primaryColor),
                onPressed: _addEducation,
              ),
          ],
        ),
        const SizedBox(height: 12),
        ..._education.asMap().entries.map((entry) => _buildEducationItem(entry.value, entry.key)).toList(),
      ],
    );
  }

  Widget _buildEducationItem(Map<String, String> edu, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  edu['degree'] ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              if (_isEditing)
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () => _removeEducation(index),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(edu['institution'] ?? '', style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
          Text(edu['year'] ?? '', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Skills', Colors.black87),
            if (_isEditing)
              IconButton(
                icon: Icon(Icons.add_circle, color: primaryColor),
                onPressed: _addSkill,
              ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _skills.asMap().entries.map((entry) => _buildSkillChip(entry.value, entry.key)).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor.withOpacity(0.6), primaryColor.withOpacity(0.3)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(skill, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          if (_isEditing) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _removeSkill(index),
              child: const Icon(Icons.close, size: 16),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: primaryColor.withOpacity(0.5), width: 2)),
      ),
      child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, primaryColor.withOpacity(0.3), Colors.transparent],
        ),
      ),
    );
  }

  Widget _buildSidebarSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildSidebarItem(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12, color: color.withOpacity(0.9)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarSkill(String skill, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 14, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              skill,
              style: TextStyle(fontSize: 12, color: color),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkExperienceItem(Map<String, String> exp) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(exp['position'] ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
          const SizedBox(height: 4),
          Text(exp['company'] ?? '', style: const TextStyle(fontSize: 14, color: Colors.white70)),
          Text(exp['duration'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.white54)),
          const SizedBox(height: 8),
          Text(exp['description'] ?? '', style: const TextStyle(fontSize: 13, color: Colors.white60, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildDarkEducationItem(Map<String, String> edu) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(edu['degree'] ?? '', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: primaryColor)),
          const SizedBox(height: 4),
          Text(edu['institution'] ?? '', style: const TextStyle(fontSize: 14, color: Colors.white70)),
          Text(edu['year'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.white54)),
        ],
      ),
    );
  }

  Widget _buildFloatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'download',
          onPressed: _downloadResume,
          backgroundColor: primaryColor.withOpacity(0.9),
          child: const Icon(Icons.download, color: Colors.white),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          heroTag: 'share',
          onPressed: _shareResume,
          backgroundColor: Colors.blue.withOpacity(0.9),
          child: const Icon(Icons.share, color: Colors.white),
        ),
      ],
    );
  }

  void _addExperience() {
    setState(() {
      _experiences.add({
        'position': 'New Position',
        'company': 'Company Name',
        'duration': '2024 - Present',
        'description': 'Add description here',
      });
    });
  }

  void _removeExperience(int index) {
    setState(() {
      _experiences.removeAt(index);
    });
  }

  void _addEducation() {
    setState(() {
      _education.add({
        'degree': 'Degree Name',
        'institution': 'Institution Name',
        'year': '2024',
      });
    });
  }

  void _removeEducation(int index) {
    setState(() {
      _education.removeAt(index);
    });
  }

  void _addSkill() {
    setState(() {
      _skills.add('New Skill');
    });
  }

  void _removeSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  void _downloadResume() {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Resume downloaded successfully!'),
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.fixed,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _shareResume() {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Share functionality coming soon!'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.fixed,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _summaryController.dispose();
    super.dispose();
  }
}