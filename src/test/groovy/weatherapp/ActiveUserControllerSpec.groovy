package weatherapp

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.web.controllers.ControllerUnitTest
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
        given:
        Map citiesMap = [0 : [ 0 : "city" , 1 : "geocode" , 2 : "country" , 3 : "country, city" ]]



        when:
        params.cityChoice = "country, city"
        views['/activeUser/_currentWeather.gsp'] = 'mock template contents'
        controller.getCurrentWeather()


        then:
        response.text == 'mock template contents'



    }




}
