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

        def countryNameList = Country.listOrderByCountryName().collect {it.countryName}

        def cityNameList = servletContext.cities



        def y = countryNameList.size()


        [locations: locations, currentUser: currentUser, countries: countryNameList , size: y]

    }




}
