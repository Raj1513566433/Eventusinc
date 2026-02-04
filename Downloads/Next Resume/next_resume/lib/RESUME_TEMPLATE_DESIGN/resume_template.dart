import 'package:flutter/material.dart';
import 'dart:ui';
import 'resume_templates_data.dart';

class ResumeTemplatePage extends StatefulWidget {
  final ResumeTemplateData templateData;
  final int templateIndex;
  
  const ResumeTemplatePage({
    super.key,
    required this.templateData,
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
        'position': 'Senior Position',
        'company': 'Company Name',
        'duration': '2020 - Present',
        'description': 'Led multiple projects and delivered exceptional results',
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
              widget.templateData.primaryColor.withOpacity(0.1),
              Colors.white,
              widget.templateData.primaryColor.withOpacity(0.05),
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
                  widget.templateData.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  widget.templateData.description,
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
              if (!_isEditing) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Changes saved!'),
                    backgroundColor: widget.templateData.primaryColor,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                );
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: _isEditing 
                        ? widget.templateData.primaryColor.withOpacity(0.6)
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

  Widget _buildResumeByType() {
    switch (widget.templateData.type) {
      case ResumeTemplateType.modern:
        return _buildModernTemplate();
      case ResumeTemplateType.professional:
        return _buildProfessionalTemplate();
      case ResumeTemplateType.creative:
        return _buildCreativeTemplate();
      case ResumeTemplateType.minimal:
        return _buildMinimalTemplate();
      case ResumeTemplateType.executive:
        return _buildExecutiveTemplate();
      case ResumeTemplateType.tech:
        return _buildTechTemplate();
      case ResumeTemplateType.designer:
        return _buildDesignerTemplate();
      case ResumeTemplateType.academic:
        return _buildAcademicTemplate();
      case ResumeTemplateType.simple:
        return _buildSimpleTemplate();
      case ResumeTemplateType.colorful:
        return _buildColorfulTemplate();
      case ResumeTemplateType.elegant:
        return _buildElegantTemplate();
      case ResumeTemplateType.bold:
        return _buildBoldTemplate();
      default:
        return _buildModernTemplate();
    }
  }

  // Modern Template
  Widget _buildModernTemplate() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.templateData.primaryColor.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.templateData.primaryColor.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header with colored background
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.templateData.primaryColor,
                      widget.templateData.secondaryColor,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    _buildProfilePicture(Colors.white),
                    const SizedBox(height: 16),
                    _buildEditableText(_nameController, 28, FontWeight.bold, Colors.white, 'Name'),
                    const SizedBox(height: 8),
                    _buildEditableText(_titleController, 18, FontWeight.normal, Colors.white.withOpacity(0.9), 'Title'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildContactInfo(),
                    const SizedBox(height: 24),
                    _buildDivider(),
                    const SizedBox(height: 24),
                    _buildSummary(),
                    const SizedBox(height: 24),
                    _buildDivider(),
                    const SizedBox(height: 24),
                    _buildExperience(),
                    const SizedBox(height: 24),
                    _buildDivider(),
                    const SizedBox(height: 24),
                    _buildEducation(),
                    const SizedBox(height: 24),
                    _buildDivider(),
                    const SizedBox(height: 24),
                    _buildSkills(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Professional Template (Traditional Layout)
  Widget _buildProfessionalTemplate() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
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
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  _buildEditableText(_nameController, 32, FontWeight.bold, Colors.black87, 'Name'),
                  const SizedBox(height: 8),
                  _buildEditableText(_titleController, 18, FontWeight.normal, widget.templateData.primaryColor, 'Title'),
                  const SizedBox(height: 16),
                  _buildContactInfo(),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(height: 2, color: widget.templateData.primaryColor),
            const SizedBox(height: 32),
            _buildSummary(),
            const SizedBox(height: 32),
            _buildExperience(),
            const SizedBox(height: 32),
            _buildEducation(),
            const SizedBox(height: 32),
            _buildSkills(),
          ],
        ),
      ),
    );
  }

  // Creative Template
  Widget _buildCreativeTemplate() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              widget.templateData.primaryColor.withOpacity(0.05),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.templateData.primaryColor.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Sidebar
            Container(
              width: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.templateData.primaryColor,
                    widget.templateData.secondaryColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildProfilePicture(Colors.white),
                  const SizedBox(height: 30),
                  _buildSectionTitle('Contact', Colors.white),
                  const SizedBox(height: 12),
                  _buildCompactContactInfo(Colors.white),
                  const SizedBox(height: 30),
                  _buildSectionTitle('Skills', Colors.white),
                  const SizedBox(height: 12),
                  _buildVerticalSkills(Colors.white),
                ],
              ),
            ),
            // Right Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableText(_nameController, 28, FontWeight.bold, Colors.black87, 'Name'),
                    const SizedBox(height: 8),
                    _buildEditableText(_titleController, 18, FontWeight.normal, widget.templateData.primaryColor, 'Title'),
                    const SizedBox(height: 24),
                    _buildSummary(),
                    const SizedBox(height: 24),
                    _buildExperience(),
                    const SizedBox(height: 24),
                    _buildEducation(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Minimal Template
  Widget _buildMinimalTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEditableText(_nameController, 36, FontWeight.w300, Colors.black87, 'Name'),
          const SizedBox(height: 4),
          _buildEditableText(_titleController, 16, FontWeight.normal, Colors.grey, 'Title'),
          const SizedBox(height: 24),
          _buildContactInfo(),
          const SizedBox(height: 40),
          _buildSummary(),
          const SizedBox(height: 40),
          _buildExperience(),
          const SizedBox(height: 40),
          _buildEducation(),
          const SizedBox(height: 40),
          _buildSkills(),
        ],
      ),
    );
  }

  // Executive Template
  Widget _buildExecutiveTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: widget.templateData.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _buildEditableText(_nameController, 32, FontWeight.bold, widget.templateData.primaryColor, 'Name'),
                const SizedBox(height: 8),
                _buildEditableText(_titleController, 18, FontWeight.w500, Colors.black87, 'Title'),
                const SizedBox(height: 16),
                _buildContactInfo(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                _buildSummary(),
                const SizedBox(height: 32),
                _buildExperience(),
                const SizedBox(height: 32),
                _buildEducation(),
                const SizedBox(height: 32),
                _buildSkills(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Tech Template
  Widget _buildTechTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 60,
                color: widget.templateData.primaryColor,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableText(_nameController, 28, FontWeight.bold, Colors.white, 'Name'),
                    const SizedBox(height: 4),
                    _buildEditableText(_titleController, 16, FontWeight.normal, widget.templateData.primaryColor, 'Title'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildContactInfoDark(),
          const SizedBox(height: 32),
          _buildSectionTitle('About', Colors.white),
          const SizedBox(height: 12),
          _buildSummaryDark(),
          const SizedBox(height: 32),
          _buildSectionTitle('Experience', Colors.white),
          const SizedBox(height: 12),
          _buildExperienceDark(),
          const SizedBox(height: 32),
          _buildSectionTitle('Education', Colors.white),
          const SizedBox(height: 12),
          _buildEducationDark(),
          const SizedBox(height: 32),
          _buildSectionTitle('Skills', Colors.white),
          const SizedBox(height: 12),
          _buildSkillsDark(),
        ],
      ),
    );
  }

  // Designer Template
  Widget _buildDesignerTemplate() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.templateData.primaryColor.withOpacity(0.1),
            widget.templateData.secondaryColor.withOpacity(0.05),
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
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: widget.templateData.primaryColor.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildProfilePicture(widget.templateData.primaryColor),
                const SizedBox(height: 16),
                _buildEditableText(_nameController, 28, FontWeight.bold, Colors.black87, 'Name'),
                const SizedBox(height: 8),
                _buildEditableText(_titleController, 16, FontWeight.normal, widget.templateData.primaryColor, 'Title'),
                const SizedBox(height: 16),
                _buildContactInfo(),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSummary(),
          const SizedBox(height: 24),
          _buildExperience(),
          const SizedBox(height: 24),
          _buildEducation(),
          const SizedBox(height: 24),
          _buildSkills(),
        ],
      ),
    );
  }

  // Academic Template
  Widget _buildAcademicTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildEditableText(_nameController, 30, FontWeight.bold, Colors.black87, 'Name'),
          const SizedBox(height: 8),
          _buildEditableText(_titleController, 16, FontWeight.normal, Colors.black54, 'Title'),
          const SizedBox(height: 8),
          _buildContactInfo(),
          const SizedBox(height: 32),
          const Divider(thickness: 1),
          const SizedBox(height: 32),
          _buildSummary(),
          const SizedBox(height: 32),
          _buildEducation(),
          const SizedBox(height: 32),
          _buildExperience(),
          const SizedBox(height: 32),
          _buildSkills(),
        ],
      ),
    );
  }

  // Simple Template
  Widget _buildSimpleTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEditableText(_nameController, 32, FontWeight.bold, Colors.black87, 'Name'),
          const SizedBox(height: 8),
          _buildEditableText(_titleController, 18, FontWeight.normal, Colors.black54, 'Title'),
          const SizedBox(height: 24),
          _buildContactInfo(),
          const SizedBox(height: 32),
          _buildSummary(),
          const SizedBox(height: 32),
          _buildExperience(),
          const SizedBox(height: 32),
          _buildEducation(),
          const SizedBox(height: 32),
          _buildSkills(),
        ],
      ),
    );
  }

  // Colorful Template
  Widget _buildColorfulTemplate() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.templateData.primaryColor.withOpacity(0.2),
            widget.templateData.secondaryColor.withOpacity(0.1),
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
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  widget.templateData.primaryColor,
                  widget.templateData.secondaryColor,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildProfilePicture(Colors.white),
                const SizedBox(height: 16),
                _buildEditableText(_nameController, 28, FontWeight.bold, Colors.white, 'Name'),
                const SizedBox(height: 8),
                _buildEditableText(_titleController, 16, FontWeight.normal, Colors.white.withOpacity(0.9), 'Title'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildContactInfo(),
                const SizedBox(height: 24),
                _buildSummary(),
                const SizedBox(height: 24),
                _buildExperience(),
                const SizedBox(height: 24),
                _buildEducation(),
                const SizedBox(height: 24),
                _buildSkills(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Elegant Template
  Widget _buildElegantTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: widget.templateData.primaryColor.withOpacity(0.3), width: 2),
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          _buildProfilePicture(widget.templateData.primaryColor),
          const SizedBox(height: 20),
          _buildEditableText(_nameController, 32, FontWeight.w600, Colors.black87, 'Name'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: widget.templateData.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: _buildEditableText(_titleController, 16, FontWeight.normal, widget.templateData.primaryColor, 'Title'),
          ),
          const SizedBox(height: 24),
          _buildContactInfo(),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  widget.templateData.primaryColor,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildSummary(),
          const SizedBox(height: 32),
          _buildExperience(),
          const SizedBox(height: 32),
          _buildEducation(),
          const SizedBox(height: 32),
          _buildSkills(),
        ],
      ),
    );
  }

  // Bold Template
  Widget _buildBoldTemplate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: widget.templateData.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                _buildEditableText(_nameController, 36, FontWeight.w900, Colors.white, 'Name'),
                const SizedBox(height: 8),
                _buildEditableText(_titleController, 20, FontWeight.w600, Colors.white.withOpacity(0.9), 'Title'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                _buildContactInfo(),
                const SizedBox(height: 32),
                _buildSummary(),
                const SizedBox(height: 32),
                _buildExperience(),
                const SizedBox(height: 32),
                _buildEducation(),
                const SizedBox(height: 32),
                _buildSkills(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _buildProfilePicture(Color iconColor) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.templateData.primaryColor.withOpacity(0.1),
        border: Border.all(
          color: widget.templateData.primaryColor.withOpacity(0.5),
          width: 3,
        ),
      ),
      child: Icon(
        Icons.person,
        size: 50,
        color: iconColor,
      ),
    );
  }

  Widget _buildEditableText(TextEditingController controller, double fontSize, FontWeight fontWeight, Color color, String label) {
    return _isEditing
        ? TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: widget.templateData.primaryColor),
              ),
              labelText: label,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          )
        : Text(
            controller.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(Icons.email, _emailController, 'Email'),
        const SizedBox(height: 8),
        _buildContactItem(Icons.phone, _phoneController, 'Phone'),
        const SizedBox(height: 8),
        _buildContactItem(Icons.location_on, _addressController, 'Address'),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, TextEditingController controller, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: widget.templateData.primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: _isEditing
              ? TextField(
                  controller: controller,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                  decoration: InputDecoration(
                    labelText: label,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                )
              : Text(controller.text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ),
      ],
    );
  }

  Widget _buildCompactContactInfo(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.email, size: 16, color: textColor),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _emailController.text,
                style: TextStyle(fontSize: 10, color: textColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.phone, size: 16, color: textColor),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _phoneController.text,
                style: TextStyle(fontSize: 10, color: textColor),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactInfoDark() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.email, size: 16, color: widget.templateData.primaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(_emailController.text, style: const TextStyle(fontSize: 12, color: Colors.white70)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Row(
            children: [
              Icon(Icons.phone, size: 16, color: widget.templateData.primaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(_phoneController.text, style: const TextStyle(fontSize: 12, color: Colors.white70)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Professional Summary', Colors.black87),
        const SizedBox(height: 12),
        _isEditing
            ? TextField(
                controller: _summaryController,
                maxLines: 4,
                style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
              )
            : Text(_summaryController.text, style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5)),
      ],
    );
  }

  Widget _buildSummaryDark() {
    return Text(
      _summaryController.text,
      style: const TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
    );
  }

  Widget _buildExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Work Experience', Colors.black87),
            if (_isEditing)
              IconButton(
                icon: Icon(Icons.add_circle, color: widget.templateData.primaryColor),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.templateData.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.templateData.primaryColor.withOpacity(0.2)),
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
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              if (_isEditing)
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () => _removeExperience(index),
                ),
            ],
          ),
          Text(exp['company'] ?? '', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7))),
          Text(exp['duration'] ?? '', style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5))),
          const SizedBox(height: 8),
          Text(exp['description'] ?? '', style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildExperienceDark() {
    return Column(
      children: _experiences.map((exp) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exp['position'] ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: widget.templateData.primaryColor)),
              const SizedBox(height: 4),
              Text(exp['company'] ?? '', style: const TextStyle(fontSize: 14, color: Colors.white70)),
              Text(exp['duration'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.white54)),
              const SizedBox(height: 8),
              Text(exp['description'] ?? '', style: const TextStyle(fontSize: 13, color: Colors.white60, height: 1.4)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEducation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Education', Colors.black87),
            if (_isEditing)
              IconButton(
                icon: Icon(Icons.add_circle, color: widget.templateData.primaryColor),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.templateData.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.templateData.primaryColor.withOpacity(0.2)),
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
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              if (_isEditing)
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () => _removeEducation(index),
                ),
            ],
          ),
          Text(edu['institution'] ?? '', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7))),
          Text(edu['year'] ?? '', style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5))),
        ],
      ),
    );
  }

  Widget _buildEducationDark() {
    return Column(
      children: _education.map((edu) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(edu['degree'] ?? '', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: widget.templateData.primaryColor)),
              const SizedBox(height: 4),
              Text(edu['institution'] ?? '', style: const TextStyle(fontSize: 14, color: Colors.white70)),
              Text(edu['year'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.white54)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Skills', Colors.black87),
            if (_isEditing)
              IconButton(
                icon: Icon(Icons.add_circle, color: widget.templateData.primaryColor),
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
          colors: [
            widget.templateData.primaryColor.withOpacity(0.6),
            widget.templateData.primaryColor.withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: widget.templateData.primaryColor.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(skill, style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500)),
          if (_isEditing) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _removeSkill(index),
              child: const Icon(Icons.close, size: 16, color: Colors.black87),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVerticalSkills(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _skills.map((skill) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Icon(Icons.check_circle, size: 14, color: textColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  skill,
                  style: TextStyle(fontSize: 11, color: textColor),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSkillsDark() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _skills.map((skill) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: widget.templateData.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: widget.templateData.primaryColor.withOpacity(0.5)),
          ),
          child: Text(skill, style: const TextStyle(fontSize: 12, color: Colors.white)),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: widget.templateData.primaryColor.withOpacity(0.5), width: 2)),
      ),
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, widget.templateData.primaryColor.withOpacity(0.3), Colors.transparent],
        ),
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
          backgroundColor: widget.templateData.primaryColor.withOpacity(0.8),
          child: const Icon(Icons.download, color: Colors.white),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          heroTag: 'share',
          onPressed: _shareResume,
          backgroundColor: Colors.blue.withOpacity(0.8),
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
          backgroundColor: const Color(0xFF1CDB02),
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