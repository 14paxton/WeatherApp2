package weatherapp



class City {


    String cityName
    String continent
    Long geonameID


    static belongsTo = [country: Country]
    static hasMany = [locations: Location]
    static constraints = {



    }



    static mapping = {


        cache: true
        country lazy: false


    }





}
