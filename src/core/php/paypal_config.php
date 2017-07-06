<?php
//Seller Sandbox Credentials- Sample credentials already provided
define("PP_USER_SANDBOX", "lamaloz_api1.yahoo.fr");
define("PP_PASSWORD_SANDBOX", "UNK6MLRAF85UU9HW");
define("PP_SIGNATURE_SANDBOX", "AFcWxV21C7fd0v3bYYYRCpSSRl31AxkRa-njy8VWiUkG0ReIAH0gX6bK");

//Seller Live credentials.
define("PP_USER","lamaloz_api1.yahoo.fr");
define("PP_PASSWORD", "XXRFVQZSG3SBXVM9");
define("PP_SIGNATURE","A8Wn8MBn2ZarpTCbGn5hwcckO34yA-9fikBOd4T8uohQIWfVQy3uaQQp");

define("PP_SANDBOX_MAIL","newsletteruht-facilitator@gmail.com");
define("PP_MAIL","lamaloz@yahoo.fr");

define("PP_SANDBOX_LINK","https://www.sandbox.paypal.com/cgi-bin/webscr");
define("PP_LINK","https://www.paypal.com/cgi-bin/webscr");

//Set this constant EXPRESS_MARK = true to skip review page
define("EXPRESS_MARK", true);

//Set this constant ADDRESS_OVERRIDE = true to prevent from changing the shipping address
define("ADDRESS_OVERRIDE", true);

//Set this constant USERACTION_FLAG = true to skip review page
define("USERACTION_FLAG", false);

//Based on the USERACTION_FLAG assign the page
if(USERACTION_FLAG){
	$page = 'return.php';
} else {
	$page = 'review.php';
}

//The URL in your application where Paypal returns control to -after success (RETURN_URL) using Express Checkout Mark Flow
define("RETURN_URL_MARK",'http://'.$_SERVER['HTTP_HOST'].preg_replace('/paypal_ec_redirect.php/','return.php',$_SERVER['SCRIPT_NAME']));

//The URL in your application where Paypal returns control to -after success (RETURN_URL) and after cancellation of the order (CANCEL_URL)
define("RETURN_URL",'http://'.$_SERVER['HTTP_HOST'].preg_replace('/paypal_ec_redirect.php/','lightboxreturn.php',$_SERVER['SCRIPT_NAME']));
define("CANCEL_URL",'http://'.$_SERVER['HTTP_HOST'].preg_replace('/paypal_ec_redirect.php/','cancel.php',$_SERVER['SCRIPT_NAME']));

//Whether Sandbox environment is being used, Keep it true for testing
define("SANDBOX_FLAG", false);

if(SANDBOX_FLAG){
	$merchantID=PP_USER_SANDBOX;  /* Use Sandbox merchant id when testing in Sandbox */
	$env= 'sandbox';
	$mail= PP_SANDBOX_MAIL;
	$link= PP_SANDBOX_LINK;
}
else {
	$merchantID=PP_USER;  /* Use Live merchant ID for production environment */
	$env='production';
	$mail= PP_MAIL;
	$link= PP_LINK;
}

//Proxy Config
define("PROXY_HOST", "127.0.0.1");
define("PROXY_PORT", "808");

//In-Context in Express Checkout URLs for Sandbox
define("PP_CHECKOUT_URL_SANDBOX", "https://www.sandbox.paypal.com/checkoutnow?token=");
define("PP_NVP_ENDPOINT_SANDBOX","https://api-3t.sandbox.paypal.com/nvp");

//Express Checkout URLs for Sandbox
//define("PP_CHECKOUT_URL_SANDBOX", "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=");
//define("PP_NVP_ENDPOINT_SANDBOX","https://api-3t.sandbox.paypal.com/nvp");

//In-Context in Express Checkout URLs for Live
define("PP_CHECKOUT_URL_LIVE","https://www.paypal.com/checkoutnow?token=");
define("PP_NVP_ENDPOINT_LIVE","https://api-3t.paypal.com/nvp");

//Express Checkout URLs for Live
//define("PP_CHECKOUT_URL_LIVE","https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=");
//define("PP_NVP_ENDPOINT_LIVE","https://api-3t.paypal.com/nvp");

//Version of the APIs
define("API_VERSION", "109.0");

//ButtonSource Tracker Code
define("SBN_CODE","PP-DemoPortal-EC-IC-php");
?>