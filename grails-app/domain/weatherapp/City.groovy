package weatherapp



class City {


    def city_name
    def country_name
    def continent
    def goname_id


    static belongsTo = [country: Country]
    static constraints = {

        id name: 'id'

    }



    static mapping = {


        cache: true


    }





}
