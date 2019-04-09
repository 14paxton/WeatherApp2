package weatherapp

import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import openweathermap.CurrentWeather
import openweathermap.OpenweathermapService
import spock.lang.Specification
import spock.lang.Unroll

class ActiveUserServiceSpec extends Specification implements ServiceUnitTest<ActiveUserService>, DataTest{

    List strings = ["one", "two", "three", "four", "five"]

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


    void "test returning correct geocode for city"() {

        given: "user picks choice from list"
        def locationChoice = "France, Aast"
        def citiesMap = [123 : [ 0 : "Aast" , 1 : 3038809 , 2 : "163" , 3 : "France, Aast" ]]



        when: "search is performed to find match"
        def returnValue =service.getCityCode(locationChoice, citiesMap)

        then: "the geocode is returned"
        returnValue == 3038809


    }

    void "test error for bad location choice"() {

        given:"bad location choice is used"
        def locationChoice = ""
        def citiesMap = [123 : [ 0 : "Aast" , 1 : 3038809 , 2 : "163" , 3 : "France, Aast" ]]



        when: "bad data is used to search the cities map"
        service.getCityCode(locationChoice, citiesMap)

        then: "an exception should be thrown"
        thrown Exception



    }








}
