package weatherapp


class Country {



    String countryName
    String countryCode




    static hasMany = [cities: City]
    static constraints = {



    }


    static mapping = {

        cache: true




    }



}
