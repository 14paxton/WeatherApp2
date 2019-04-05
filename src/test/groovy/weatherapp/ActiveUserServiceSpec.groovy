package weatherapp

import grails.testing.services.ServiceUnitTest
import openweathermap.CurrentWeather
import openweathermap.OpenweathermapService
import spock.lang.Specification
import spock.lang.Unroll

class ActiveUserServiceSpec extends Specification implements ServiceUnitTest<ActiveUserService>{

    List strings = ["one", "two", "three", "four", "five"]

    def setup() {
    }

    def cleanup() {
    }

    void "testing method"(){

        when:
        (0..5).each { strings[it] }
        strings[6]

        then:
        notThrown()



    }

    @Unroll
    void 'list pairs example'(){

        expect:
        name.size() == length

        where:
        [name, length] << [['Spock', 5], ['Kirk', 4], ['Scotty', 6]]
    }


    void "test something"() {

        setup:
        ActiveUserService activeUserService = Mock()
        activeUserService.openweathermapService = GroovyMock(OpenweathermapService)


        when:
        def locationChoice = "France, Aast"
        Map citiesMap = [123 : [ 0 : "Aast" , 1 : 3038809 , 2 : "163" , 3 : "France, Aast" ]]
        service.getCurrentWeatherValues(locationChoice, citiesMap)

        then:
        true == true




    }
}
