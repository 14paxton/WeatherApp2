package weatherapp



class City {


    String city_name
    Integer country_name
    String continent
    Long goname_id


    static belongsTo = [country: Country]
    static constraints = {



    }



    static mapping = {


        cache: true


    }





}
