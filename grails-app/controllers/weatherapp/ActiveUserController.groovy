package weatherapp

import org.springframework.security.access.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import app.admin.security.*


@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class ActiveUserController {

    def springSecurityService

    def index() {

        def currentUser = springSecurityService.currentUser

        def locations = Location.findAllByUser(currentUser)

        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {


            redirect(controller: "AdminDashboard")
        }

        def x = Country.findAll()

        def y = x.size()



        [locations: locations, currentUser: currentUser, countries: x , size: y]

    }




}
