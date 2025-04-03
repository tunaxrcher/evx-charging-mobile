/* -- LIST OF Constants used in APIs -- */

/// API EVX
/// Authentication
const String evxEndPoint = 'http://192.168.43.220:3000/api/v1'; // ต้องแก้ IP เครื่องที่เดฟอยู่ (ไว้อัพ Production ถึงจะเป็น URL จริง)
const String evxRegistration = evxEndPoint + '/auth/register';
const String evxLogin = evxEndPoint + '/auth/login';
const String evxUpdateProfile = evxEndPoint + '/profile/update_profile';
const String evxGetProfile = evxEndPoint + '/profile/get_profile';
const String evxUpdatePassword = evxEndPoint + '/profile/update_password';