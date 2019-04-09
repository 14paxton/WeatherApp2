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

        given:
        def  dummyCurrentWeather = ["weatherData" : "testData"]

        controller.openweathermapService = Mock(OpenweathermapService)
        controller.activeUserService = Mock(ActiveUserService)


        controller.activeUserService.getCityCode(_) >> 3038809
        controller.openweathermapService.currentWeatherByGeoID(_) >> dummyCurrentWeather


        when:
        views['/activeUser/_currentWeather.gsp'] = 'mock template contents'
        controller.getCurrentWeather()



        then:
        response.text == 'mock template contents'



    }



    void "check response status of method"() {

        given:
        def testMap = [:]


        testMap = ["weatherData" : currentWeather]


        controller.openweathermapService = Mock(OpenweathermapService)
        controller.activeUserService = Mock(ActiveUserService)


        controller.activeUserService.getCityCode() >> 3038809
        controller.openweathermapService.currentWeatherByGeoID(_) >> testMap


        when:
        controller.getCurrentWeather()




        then:

        response.status == 200



    }




}
