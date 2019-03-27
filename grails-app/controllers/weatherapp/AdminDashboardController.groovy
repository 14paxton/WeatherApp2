package weatherapp

import app.admin.security.User
import org.springframework.security.access.annotation.Secured



@Secured( 'ROLE_ADMIN')
class AdminDashboardController {


    def springSecurityService

    def index() {

        def currentUser = springSecurityService.currentUser
        def allUsers = User.findAll()
        allUsers.remove(currentUser)
        respond(currentUser: currentUser, allUsers: allUsers)



    }
}
