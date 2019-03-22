<g:if test="${currentWeather.weatherList}">
    <g:each in="${currentWeather.weatherList}" var="weather">
        <div class="weatherBlock">
            <h2><b>${currentWeather.cityName}</b></h2>
            <h3>${currentWeather.main?.temperature} <openweather:temperatureSymbol unit="${unit}"/></h3>
            <openweather:image icon="${weather.icon}"/>
            <h4>${weather.description}</h4>
        <g:form resource="${currentLocation}" method="POST">
            <g:hiddenField name="city" value="${currentLocation.city}" />
            <g:hiddenField name="user" value="${currentLocation.user}" />
            <g:hiddenField name="currentWeatherCall" value="${currentLocation.currentWeatherCall}" />
            <g:hiddenField name="fiveDayWeatherCall" value="${currentLocation.fiveDayWeatherCall}" />


                <input class="btn btn-primary" type="submit" value="Save Location" />

        </g:form>
        </div>
    </g:each>
</g:if>
