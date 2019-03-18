package weatherapp

import groovy.transform.ToString


@ToString
class Country {



    def countryName




    static hasMany = [cities: City]
    static constraints = {



    }


    static mapping = {

        cache: true

        countryName column: 'country_name'


    }



}
