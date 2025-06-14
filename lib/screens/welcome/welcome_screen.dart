import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/roadmap/roadmap_screen.dart';
import 'package:quiz_app/services/shared_preferences_service.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String selectedGender = '';
  String selectedDisability = '';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? size.width * 0.2 : kDefaultPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: kLargePadding),
                      _buildHeader(),
                      SizedBox(height: kLargePadding * 1.5),
                      _buildForm(),
                      SizedBox(height: kLargePadding),
                      _buildContinueButton(),
                      SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.circular(kLargeRadius),
                boxShadow: kElevatedShadow,
              ),
              child: Icon(
                Icons.school_rounded,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              'குறளும் கதையும்',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: kTextPrimaryColor,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: kSmallPadding),
            Text(
              'உங்கள் தகவல்களை கீழே உள்ளிடவும்',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: kTextSecondaryColor,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(kDefaultRadius),
            boxShadow: kCardShadow,
          ),
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormField(
                label: 'முழு பெயர்',
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    hintStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: kTextSecondaryColor,
                    ),
                  ),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kTextPrimaryColor,
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              _buildFormField(
                label: 'பாலினம்',
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Gender",
                    prefixIcon: Icon(Icons.people_outline_rounded),
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kTextSecondaryColor,
                    ),
                  ),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      value: "ஆண்",
                      child: Text(
                        "ஆண்",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "பெண்",
                      child: Text(
                        "பெண்",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "மற்றவை",
                      child: Text(
                        "மற்றவை",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? '';
                    });
                  },
                ),
              ),
              SizedBox(height: kDefaultPadding),
              _buildFormField(
                label: 'பிறந்த தேதி',
                child: InkWell(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: kPrimaryColor,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      setState(() {
                        dobController.text =
                            "${picked.day}/${picked.month}/${picked.year}";
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kSmallPadding + 2,
                    ),
                    decoration: BoxDecoration(
                      color: kCardColor,
                      border: Border.all(color: Color(0xFFE2E8F0)),
                      borderRadius: BorderRadius.circular(kSmallRadius),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: kTextSecondaryColor,
                          size: 20,
                        ),
                        SizedBox(width: kSmallPadding),
                        Expanded(
                          child: Text(
                            dobController.text.isEmpty
                                ? "Date of Birth"
                                : dobController.text,
                            style: GoogleFonts.inter(
                              color: dobController.text.isEmpty
                                  ? kTextSecondaryColor
                                  : kTextPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              _buildFormField(
                label: 'இயலாமை',
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Disability",
                    prefixIcon: Icon(Icons.accessibility_new_rounded),
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kTextSecondaryColor,
                    ),
                  ),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      value: "அறிவாற்றல் குறைபாடு",
                      child: Text(
                        "அறிவாற்றல் குறைபாடு",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "கேள்வி குறைபாடு",
                      child: Text(
                        "கேள்வி குறைபாடு",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "காட்சி குறைபாடு",
                      child: Text(
                        "காட்சி குறைபாடு",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "உடல் குறைபாடு",
                      child: Text(
                        "உடல் குறைபாடு",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "பேசும் குறைபாடு",
                      child: Text(
                        "பேசும் குறைபாடு",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "மற்றவைகள்",
                      child: Text(
                        "மற்றவைகள்",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: kTextPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedDisability = value ?? '';
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: kTextPrimaryColor,
          ),
        ),
        SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _buildContinueButton() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: kPrimaryGradient,
            borderRadius: BorderRadius.circular(kDefaultRadius),
            boxShadow: kCardShadow,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _handleContinue,
              borderRadius: BorderRadius.circular(kDefaultRadius),
              child: Center(
                child: Text(
                  'தொடங்குவோம்',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleContinue() async {
    if (nameController.text.isEmpty ||
        selectedGender.isEmpty ||
        dobController.text.isEmpty ||
        selectedDisability.isEmpty) {
      Get.snackbar(
        'தகவல் தேவை',
        'அனைத்து விவரங்களையும் பூர்த்தி செய்யவும்',
        backgroundColor: kErrorColor,
        colorText: Colors.white,
        borderRadius: kSmallRadius,
        margin: EdgeInsets.all(kDefaultPadding),
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        icon: Icon(Icons.warning_rounded, color: Colors.white),
      );
      return;
    }

    await SharedPreferencesService.saveUserDetails(
      name: nameController.text,
      gender: selectedGender,
      dateOfBirth: dobController.text,
      disability: selectedDisability,
    );

    Get.offAll(
      () => RoadmapScreen(),
      transition: Transition.rightToLeftWithFade,
      duration: Duration(milliseconds: 500),
    );
  }
}
