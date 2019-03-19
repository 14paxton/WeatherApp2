package weatherapp

import groovy.transform.ToString


@ToString
class Country {



    String countryName




    static hasMany = [cities: City]
    static constraints = {



    }


    static mapping = {

        cache: true



    }



}
