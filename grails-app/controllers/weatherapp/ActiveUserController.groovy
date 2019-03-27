package weatherapp

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
import groovy.transform.CompileStatic
import openweathermap.CurrentWeather
import openweathermap.ForecastWeather
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

        def countryNameList = Country.listOrderByCountryName().collect {it.countryName}.minus('United States')
        def locationList = Location.findAllByUser(currentUser)
        def locationCount = locationList.size()

        //if there is a location use the last added to supply forecast widget
        //otherwise use default location
        def forecastData

        if(locationList)
        {
           forecastData = openweathermapService.GetForecastFromString(locationList.last().fiveDayWeatherCall)

        }
        else
        {
            //default search Hollywood
            forecastData = openweathermapService.GetForecastFromString("http://api.openweathermap.org/data/2.5/forecast?id=4158928&APPID=097e124b838ecac32ee6299a03694e0d&&units=imperial")

        }

        //def cityNameList = servletContext.cities
        //def y = countryNameList.size()

        def jsonList = countryNameList as JSON

        [locations: locations, currentUser: currentUser, countries: countryNameList , locationList: locationList,
         locationCount: locationCount, forecastWeather: forecastData , jsonList: jsonList]

    }




    def showSavedLocationWeather()
    {
        def currentUser = springSecurityService.currentUser

        def locations = Location.findAllByUser(currentUser)

        def countryNameList = Country.listOrderByCountryName().collect {it.countryName}.minus('United States')
        def locationList = Location.findAllByUser(currentUser)

        def  forecastData = openweathermapService.GetForecastFromString(params.locationURL)


        def jsonList = countryNameList as JSON

        render(view: "/activeUser/index", model: [locations: locations, currentUser: currentUser, countries: countryNameList ,
                                                  locationList: locationList, forecastWeather: forecastData , jsonList: jsonList])
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

    def getMatchingCities() {

         [ cityNames: City.findAllByCountry(Country.findByCountryName(params.countryChoice))]

    }

    def showWeather() {

        def currentUser = springSecurityService.currentUser



        def values = openweathermapService.currentWeather(Long.valueOf(params.cityChoice))

        CurrentWeather currentWeather = values["weatherData"]
        ForecastWeather forecastWeather = values["fiveDayData"]

        Location currentLocation = values["location"]
        currentLocation.city = City.findByGeonameID(Long.valueOf(params.cityChoice))
        currentLocation.user = currentUser


        render(view: "/activeUser/index", model: [currentUser: currentUser  ,currentWeather: currentWeather, unit: Unit.Imperial ,
                                                  currentLocation: currentLocation, forecastWeather: forecastWeather])

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
