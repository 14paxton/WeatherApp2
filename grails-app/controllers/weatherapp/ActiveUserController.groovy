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
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import sun.security.ec.ECDSASignature

import java.text.SimpleDateFormat


@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class ActiveUserController {

    def springSecurityService
    OpenweathermapService openweathermapService
    ActiveUserService     activeUserService

    def index() {

        def currentUser = springSecurityService.currentUser
        def lang = RCU.getLocale(request)

        SimpleDateFormat df2 = new SimpleDateFormat("EEE MMM dd", lang)


        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {


            redirect(controller: "AdminDashboard")
        }

        def locationList = Location.findAllByUser(currentUser)

        def forecastData

        if(locationList)
        {
           forecastData = openweathermapService.GetForecastFromString(locationList.last().fiveDayWeatherCall)

        }
        else
        {

            forecastData = openweathermapService.GetForecastFromString("http://api.openweathermap.org/data/2.5/forecast?id=4158928&APPID=097e124b838ecac32ee6299a03694e0d&&units=imperial")

        }

       def x = forecastData .forecastDayList[0].javaDate


        def y = df2.format(forecastData .forecastDayList[0].javaDate)


        // json list originally used to populate user choices,
        // now use getLocationChoiceList() with ajax call
       // def jsonList = servletContext.choiceList as JSON

        [ currentUser: currentUser , locationList: locationList,
          forecastWeather: forecastData ,  lang: lang , dateFormatter: df2, encoding: "UTF-8"]

    }



    //method called by ajax to populate the user choice list for autocomplete
    def getLocationChoiceList()
    {
        def jsonList = servletContext.choiceList

        render jsonList as JSON
    }




    def showSavedLocationWeather()
    {
        def currentUser = springSecurityService.currentUser
        def lang = RCU.getLocale(request)
        SimpleDateFormat df2 = new SimpleDateFormat("EEE MMM dd", lang)

        def locations = Location.findAllByUser(currentUser)

        def countryNameList = Country.listOrderByCountryName().collect {it.countryName}.minus('United States')
        def locationList = Location.findAllByUser(currentUser)

        def  forecastData = openweathermapService.GetForecastFromString(params.locationURL)


        //def jsonList = countryNameList as JSON

        render(view: "/activeUser/index", model: [locations: locations, currentUser: currentUser, countries: countryNameList ,
                                                  locationList: locationList, forecastWeather: forecastData ,
                                                    lang: lang, dateFormatter: df2])
    }





    //this should return  and render the current weather template on the page
    // this is being called from an ajax call upon submit of location
    def getCurrentWeather()
    {

        def currentWeather = activeUserService.getCurrentWeatherValues(params.cityChoice, servletContext.citiesMap)

        render  template: 'currentWeather', model: [currentWeather: currentWeather]




    }


    //method to get info for 5 day forcast and populate widget

    def showForecast(Long id) {

        def currentUser = springSecurityService.currentUser
        def locationList = Location.findAllByUser(currentUser)
        def lang = RCU.getLocale(request)
        def df2 = new SimpleDateFormat("EEE MMM dd", lang)
        def saveOption = true


        def values = openweathermapService.currentWeather(id)


        //CurrentWeather currentWeather = values["weatherData"]
        ForecastWeather forecastWeather = values["fiveDayData"]

        Location currentLocation = values["location"]
        currentLocation.city = City.findByGeonameID(id)
        currentLocation.user = currentUser

        //def jsonList = servletContext.choiceList as JSON

        render(view: "/activeUser/index", model: [ currentLocation: currentLocation, forecastWeather: forecastWeather, locationList: locationList,
                                                  lang: lang, saveOption: saveOption, dateFormatter: df2])

    }






   /* testing method for testing tests */


    def test(){




    }









   /* old methods saved for references*/



    def showWeather() {

        def currentUser = springSecurityService.currentUser
        def locationList = Location.findAllByUser(currentUser)
        def lang = RCU.getLocale(request)
        def df2 = new SimpleDateFormat("EEE MMM dd", lang)
        def saveOption = true

        def cityChoice = servletContext.citiesMap.find{key, value -> value[3].equals(params.cityChoice)}

        if(cityChoice == null)
        {
            flash.message = "No Country By That Name"
            redirect(action: "index")
        }
        else
        {
            def cityCode = cityChoice.value[1]

            if(cityCode == null){

                flash.message = "No info for that country"
                redirect controller:"ActiveUser", action:"index", method:"GET"

            }
            else{

                def values = openweathermapService.currentWeather(cityCode)



                CurrentWeather currentWeather = values["weatherData"]
                ForecastWeather forecastWeather = values["fiveDayData"]

                Location currentLocation = values["location"]
                currentLocation.city = City.findByGeonameID(cityCode)
                currentLocation.user = currentUser

                //def jsonList = servletContext.choiceList as JSON

                render(view: "/activeUser/index", model: [currentWeather: currentWeather, unit: Unit.Imperial ,
                                                          currentLocation: currentLocation, forecastWeather: forecastWeather, locationList: locationList,
                                                           lang: lang, saveOption: saveOption, dateFormatter: df2])
            }



        }



    }


    def old_showWeather() {

        def currentUser = springSecurityService.currentUser



        def values = openweathermapService.currentWeather(Long.valueOf(params.cityChoice))

        CurrentWeather currentWeather = values["weatherData"]
        ForecastWeather forecastWeather = values["fiveDayData"]

        Location currentLocation = values["location"]
        currentLocation.city = City.findByGeonameID(Long.valueOf(params.cityChoice))
        currentLocation.user = currentUser


        render(view: "/activeUser/index", model: [currentUser: currentUser  ,currentWeather: currentWeather, unit: Unit.Imperial ,
                                                  currentLocation: currentLocation, forecastWeather: forecastWeather, ])

    }




    def demo(String unit) {
        Unit unitEnum = Unit.unitWithString(unit)
        CurrentWeather currentWeather = openweathermapService.currentWeather(unitEnum)
        [currentWeather: currentWeather, unit: unitEnum]
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

        def cityList = City.findAllByCountry(Country.findByCountryName(params.countryChoice)).collect {it.cityName}
        def cityListJSON = cityList as JSON

        [ cityListJSON: cityListJSON, cityList: cityList ]

    }


}
