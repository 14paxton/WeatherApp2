package weatherapp

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.web.controllers.ControllerUnitTest
import openweathermap.CurrentWeather
import spock.lang.Specification

class ActiveUserControllerSpec extends Specification implements ControllerUnitTest<ActiveUserController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test template"() {

        when:
        views['/activeUser/_currentWeather.gsp'] = 'mock template contents'
        controller.test()

        then:
        response.text == 'mock template contents'



    }

    void "test that currentWeather template renders"() {



        when:
        def currentWeather = Mock(CurrentWeather)
        views['/activeUser/_currentWeather.gsp'] = 'mock template contents'
        controller.getCurrentWeather()


        then:
        response.text == 'mock template contents'



    }




}
