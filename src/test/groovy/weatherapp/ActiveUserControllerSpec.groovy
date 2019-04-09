package weatherapp

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.web.controllers.ControllerUnitTest
import openweathermap.CurrentWeather
import openweathermap.OpenweathermapService
import openweathermap.Weather
import org.springframework.beans.factory.annotation.Autowired
import spock.lang.Shared
import spock.lang.Specification

class ActiveUserControllerSpec extends Specification implements ControllerUnitTest<ActiveUserController> {

    @Autowired
    OpenweathermapService openweathermapService = new OpenweathermapService()

    @Autowired
    ActiveUserService activeUserService = new ActiveUserService()

    @Shared CurrentWeather currentWeather = new CurrentWeather()




    def setup(){

        currentWeather.weatherList = []
        Weather weather = new Weather()
        weather.id = 803
        weather.description = 'broken clouds'
        weather.icon = '04d'
        weather.main = 'Clouds'
        currentWeather.weatherList << weather
        currentWeather.cityName ='London'
        currentWeather.code = 200
        currentWeather.cityId = 2643743
        currentWeather.visibility = 10000
        currentWeather.base = 'stations'
        currentWeather.dt = 1502707800





    }




    void "test that currentWeather template renders"() {

        given: "using a map with dummy data and mocking the services used"
        def  dummyCurrentWeather = ["weatherData" : "testData"]

        controller.openweathermapService = Mock(OpenweathermapService)
        controller.activeUserService = Mock(ActiveUserService)


        controller.activeUserService.getCityCode(_) >> 3038809
        controller.openweathermapService.currentWeatherByGeoID(_) >> dummyCurrentWeather


        when: "you mock the template being used and clal the method"
        views['/activeUser/_currentWeather.gsp'] = 'mock template contents'
        controller.getCurrentWeather()



        then: "the response with show the rendered template"
        response.text == 'mock template contents'



    }



    void "check response status of method"() {

        given: "setting up the Map with a current weather object, mocking the servivces used," +
                "and stubbing values in to the method calls"
        def testMap = [:]


        testMap = ["weatherData" : currentWeather]


        controller.openweathermapService = Mock(OpenweathermapService)
        controller.activeUserService = Mock(ActiveUserService)


        controller.activeUserService.getCityCode() >> 3038809
        controller.openweathermapService.currentWeatherByGeoID(_) >> testMap


        when: "the method is run"
        controller.getCurrentWeather()




        then: "you should get a response of 200"

        response.status == 200



    }




}
