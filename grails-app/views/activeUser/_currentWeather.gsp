    <g:each in="${currentWeather.weatherList}" var="weather">
        <div class="weatherBlock">
            <h2><b>${currentWeather.cityName}</b></h2>
            <h3>${currentWeather.main?.temperature} </h3>
            <openweather:image icon="${weather.icon}"/>
            <h4>${weather.description}</h4>

        </div>
    </g:each>
