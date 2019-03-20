package weatherapp


class Country {



    String countryName




    static hasMany = [cities: City]
    static constraints = {



    }


    static mapping = {

        cache: true




    }



}
