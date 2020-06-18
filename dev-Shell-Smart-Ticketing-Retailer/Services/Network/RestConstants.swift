import UIKit

class RestConstants {
        
    public static let BASE_URL: String = "http://3.7.238.93/api/"
    public static let API_ENDPOINT_GET_USER_LIST: String = "userList"
    public static let API_ENDPOINT_GET_WORK_ORDERS: String = "workOrders"
    public static let API_ENDPOINT_GET_WORK_IN_PAGE_LIMIT: String = "/api/todo/done?page=%@&limit=%@&type[]=%@"
    public static let API_ENDPOINT_LOGIN_USER: String = "login"
    public static let API_ENDPOINT_SEND_OTP: String = "auth/otp"
    
    // Response code
    //
    public static let HTTP_CODE_OK: Int = 200
    public static let HTTP_CODE_OK_1: Int = 201
    
    public static let HTTP_CODE_SUCCESS_OK: Int = 200
    public static let HTTP_CODE_SUCCESS_CREATED: Int = 201
    public static let HTTP_CODE_SUCCESS_NO_CONTENT: Int = 204
    public static let HTTP_CODE_SUCCESS_RESET_CONTENT: Int = 205
    public static let HTTP_CODE_SUCCESS_PARTIAL_CONTENT: Int = 206
    public static let HTTP_CODE_SUCCESS_MULTI_STATUS: Int = 207
    
    public static let HTTP_PCODE_CLIENT_ERROR_BAD_REQUEST: Int = 400
    public static let HTTP_CODE_CLIENT_ERROR_UNAUTHORIZED: Int = 401
    public static let HTTP_CODE_CLIENT_ERROR_FORBIDDEN: Int = 403
    public static let HTTP_CODE_CLIENT_ERROR_NOT_FOUND: Int = 404
    public static let HTTP_CODE_CLIENT_ERROR_CONFLICT: Int = 409
    
    public static let HTTP_CODE_SERVER_ERROR_INTERNAL_SERVER_ERROR: Int = 500
    
    // Headers
    //
    public static let HTTP_HEADERS_AUTHORIZATION: String = "Authorization"
    public static let HTTP_HEADERS_BEARER: String = "Bearer %@"
}

