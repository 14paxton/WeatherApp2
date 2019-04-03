package weatherapp

import app.admin.security.User
import org.springframework.security.access.annotation.Secured
import org.springframework.web.servlet.support.RequestContextUtils


@Secured( 'ROLE_ADMIN')
class AdminDashboardController {


    def springSecurityService

    def index() {

        def currentUser = springSecurityService.currentUser
        def lang = RequestContextUtils.getLocale(request)
        def allUsers = User.findAll()
        allUsers.remove(currentUser)
        render (view: "index" ,  model: [currentUser: currentUser, allUsers: allUsers, lang: lang], encoding: "UTF-8")



    }
}
