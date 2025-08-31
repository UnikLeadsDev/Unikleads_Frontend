import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_application/applicant_address_screen.dart';
import 'package:loan_application/applicant_bank_details.dart';
import 'package:loan_application/applicant_basic_details.dart';
import 'package:loan_application/applicant_buisness_details.dart';
import 'package:loan_application/applicant_documents.dart';
import 'package:loan_application/applicant_employment_address.dart';
import 'package:loan_application/applicant_employment_details.dart';
import 'package:loan_application/applicant_non_financial_parameters.dart';
import 'package:loan_application/applicant_kyc-documents.dart';
import 'package:loan_application/applicant_premises_photo.dart';
import 'package:loan_application/applied_product.dart';
import 'package:loan_application/co_applicant_address.dart';
import 'package:loan_application/co_applicant_basic_details.dart';
import 'package:loan_application/co_applicant_kyc.dart';
import 'package:loan_application/complete_preview.dart';
import 'package:loan_application/document_signing.dart';
import 'package:loan_application/faq.dart';
import 'package:loan_application/filter.dart';
import 'package:loan_application/guarantor1_kyc.dart';
import 'package:loan_application/guarantor2_kyc.dart';
import 'package:loan_application/guarrantor1_address.dart';
import 'package:loan_application/guarrantor1_basic_details.dart';
import 'package:loan_application/guarrantor2_address.dart';
import 'package:loan_application/guarrantor2_basic_details.dart';
import 'package:loan_application/leads.dart';
import 'package:loan_application/leads_dashboard.dart';
import 'package:loan_application/loan_disbursement_status.dart';
import 'package:loan_application/loan_fee_charges.dart';
import 'package:loan_application/applicant_refrence_details.dart' ;
import 'package:loan_application/login.dart';
import 'package:loan_application/main_dashboard.dart';
import 'package:loan_application/my_partners.dart';
import 'package:loan_application/my_revenue.dart';
import 'package:loan_application/otp_screen.dart';
import 'package:loan_application/profile.dart';
import 'package:loan_application/referal_program.dart';
import 'package:loan_application/referal_steps.dart';
import 'package:loan_application/register_paper_nach.dart';
import 'package:loan_application/support_screen.dart';
import 'my_sales_dashboard.dart'; 

void main() {
  runApp(const LoanApplicationApp());
}

class LoanApplicationApp extends StatelessWidget {
  const LoanApplicationApp({super.key});



 @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Base design size (iPhone 12 Pro)

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Loan Application',
          debugShowCheckedModeBanner: false,
          
          home: 
               //AppliedProductScreen(),
              //ApplicantAddressScreen(),
               //ApplicantKYCDocumentsScreen(),
              // CoApplicantBasicDetailsScreen(),
              //CoApplicantAddress(),
               //Guarrantor1BasicDetails(),
              // Guarrantor1Address(),
              // Guarrantor2Address(),
              // COApplicantKYCDocumentsScreen(),
              // Guarantor1KYCDocumentsScreen(),
              // Guarantor2KYCDocumentsScreen(),
              // ApplicantEmploymentDetailsScreen(),
              // ApplicantNonFinancialParametersScreen(),
              // ApplicantBusinessDetailsScreen(),
              // ReferenceDetailsScreen(),
              // ApplicantDocumentsScreen(),
              // ApplicantBankDetailsScreen(),
              // LoanFeeChargesDetailsScreen(),
              // ApplicantPremisesPhotosScreen(),
              // RegisterPaperNachScreen(),
              // DocumentSigningScreen(),
              // LoanDisbursementStatusScreen(),
              // SuccessScreen(),
              // DashboardScreen(),
              // SupportScreen(),
              //MainDashboardScreen(),
              // RevenueScreen(),
              // ProfileScreen(),
             LoginScreen(),
              // OtpVerificationScreen(),
              // ReferralProgramScreen(),
              // ReferralSteps(),
              // MainDashboard(),
              // FilterScreen(),
              // MyAllPartnersScreen(),
              //ReferenceDetailsScreen(),
              //LoanOptionsScreen(),
              //FAQScreen(),
        );
      },
    );
  }
}