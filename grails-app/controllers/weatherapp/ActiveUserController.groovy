package weatherapp

import org.springframework.security.access.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import groovy.transform.CompileStatic
import openweathermap.CurrentWeather
import openweathermap.OpenweathermapService
import openweathermap.Unit
import app.admin.security.*


@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class ActiveUserController {

    def springSecurityService
    OpenweathermapService openweathermapService

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


    def old_index() {

        def currentUser = springSecurityService.currentUser

        def locations = Location.findAllByUser(currentUser)

        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {


            redirect(controller: "AdminDashboard")
        }

        def countryNameList = Country.listOrderByCountryName().collect {it.countryName}



        [locations: locations, currentUser: currentUser, countries: countryNameList ]

    }


    def getCities() {

        def currentUser = springSecurityService.currentUser

       // def cityNameList = servletContext.cities

        def cont = Country.findByCountryName(params.countryChoice)

       // def x = cityNameList.findAll {y -> y.country == {cont}}



        def matchingCities = City.findAllByCountry(cont)


        render(view: "/activeUser/index", model: [currentUser: currentUser  , cityNames: matchingCities])



    }

    def showWeather() {

        def currentUser = springSecurityService.currentUser



        def values = openweathermapService.currentWeather(Long.valueOf(params.cityChoice))

        CurrentWeather currentWeather = values["weatherData"]

        Location currentLocation = values["location"]
        currentLocation.city = City.findByGeonameID(Long.valueOf(params.cityChoice))
        currentLocation.user = currentUser


        render(view: "/activeUser/index", model: [currentUser: currentUser  ,currentWeather: currentWeather, unit: Unit.Imperial , currentLocation: currentLocation])

    }

    def saveLocation()
    {

    }






    def demo(String unit) {
        Unit unitEnum = Unit.unitWithString(unit)
        CurrentWeather currentWeather = openweathermapService.currentWeather(unitEnum)
        [currentWeather: currentWeather, unit: unitEnum]
    }


}
