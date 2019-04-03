    <g:each in="${currentWeather.weatherList}" var="weather">
        <div class="weatherBlock">
            <h2><b>${currentWeather.cityName}</b></h2>
            <h3>${currentWeather.main?.temperature} </h3>
            <openweather:image icon="${weather.icon}"/>
            <h4>${weather.description}</h4>
            %{--<g:form controller="ActiveUser" action="showForecast" id="${currentWeather.id}" >
            <button class="btn btn-submit" type="submit" value="Submit" />
            </g:form>--}%
            <a href="${createLink( action: 'showForecast', id: currentWeather.cityId)}">Show 5 Day </a>


        </div>
    </g:each>
