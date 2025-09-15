import 'package:get/get.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'select_language': 'Select Language',
      'login_page': 'Login Page',
      'email': 'Email',
      'password': 'Password',
      'login': 'Login',
      'login_success': 'Successfully Logged In',
      'login_failed': 'Login Failed!',
      'welcome_back': 'Welcome back! Your login was successful.',
      'article_details': 'Article Details',
      'download_pdf': 'Download PDF File',
      'download_pdf_question': 'Do you want to download the PDF file?',
      'download': 'Download',
      'cancel': 'Cancel',
      'downloading': 'Downloading...',
      'articles': 'Articles',
      'no_articles': 'No articles available',
    },
    'bn': {
      'select_language': 'ভাষা নির্বাচন করুন',
      'login_page': 'লগইন পেজ',
      'email': 'ইমেইল',
      'password': 'পাসওয়ার্ড',
      'login': 'লগইন',
      'login_success': 'সফলভাবে লগইন হয়েছে',
      'login_failed': 'লগইন ব্যর্থ!',
      'welcome_back': 'ফিরে আসার জন্য ধন্যবাদ! আপনার লগইন সফল হয়েছে।',
      'article_details': 'প্রবন্ধের বিস্তারিত',
      'download_pdf': 'পিডিএফ ফাইল ডাউনলোড করুন',
      'download_pdf_question': 'আপনি কি পিডিএফ ফাইলটি ডাউনলোড করতে চান?',
      'download': 'ডাউনলোড',
      'cancel': 'বাতিল',
      'downloading': 'ডাউনলোড হচ্ছে...',
      'articles': 'প্রবন্ধসমূহ',
      'no_articles': 'কোনো প্রবন্ধ পাওয়া যায়নি',
    },
  };
}
