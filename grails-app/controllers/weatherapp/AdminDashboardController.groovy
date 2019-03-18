package weatherapp

import org.springframework.security.access.annotation.Secured



@Secured( 'ROLE_ADMIN')
class AdminDashboardController {


    def springSecurityService

    def index() {

        def currentUser = springSecurityService.currentUser
        respond(currentUser: currentUser)



    }
}
