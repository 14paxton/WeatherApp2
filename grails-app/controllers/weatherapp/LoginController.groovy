/*
package weatherapp

import com.auth0.exception.APIException
import com.auth0.exception.Auth0Exception
import com.auth0.json.auth.TokenHolder
import com.auth0.net.AuthRequest
import grails.util.Holders

class LoginController {

    def index() { }


    */
/**
     * Action for logging in and authorizing with Auth0 against the talentBankAuth0UserDB realm
     * @return
     *//*

    def loginWithAuth0() {
        def callbackResponse
        def authSuccess
        def responseData = new ResponseData()
        responseData.text = message(code: 'springSecurity.errors.login.email.fail')

        AuthRequest authRequest = authAPI.login(params?.email, params?.password, Holders.getConfig()?.auth0?.defaultPasswordGrantDatabase)
                .setAudience("${Holders.getConfig()?.auth0?.issuer}/userinfo")
                .setScope("openid profile email access_token");

        def idToken
        try {
            TokenHolder holder = authRequest.execute();
            callbackResponse = callbackService.handle(request, holder)
            idToken = callbackResponse?.idToken
            authSuccess = true
        } catch (APIException exception) {
            log.debug("${message(code: 'auth0.login.authRequest.error', default: "Error while attempting authentication with Auth0.")} APIException -  Email = ${params?.email}  Exception = ${exception}")
        } catch (Auth0Exception exception) {
            log.debug("${message(code: 'auth0.login.authRequest.error', default: "Error while attempting authentication with Auth0.")} Auth0Exception -  Email = ${params?.email}  Exception = ${exception}")
        }

        if (authSuccess) {
            def redirectURI = "/am${Holders.getConfig()?.auth0?.loginRedirectOnSuccessSetTokenCookie}"

            response.status = 200
            responseData.text = "${config?.auth0?.coreCookieDomain}"
            responseData.redirect = redirectURI

            render responseData.toJson();
            return
        }

        response.status = 401
        render responseData.toJson()
    }

}
*/
