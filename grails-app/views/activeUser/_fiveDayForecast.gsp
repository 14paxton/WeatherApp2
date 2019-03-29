<div class="w3ls-weather-agileinfo">
    <div class="weather-left">
        <div class="weather-left-text">
            <h4>${forecastWeather.cityName}</h4>
            <h5>${dateFormatter.format(forecastWeather.forecastDayList[0].javaDate)} </h5>
            <g:if test="${saveOption}">
                <g:form resource="${currentLocation}" method="POST">
                    <g:hiddenField name="city" value="${currentLocation.city.id}" />
                    <g:hiddenField name="user" value="${currentLocation.user.id}" />
                    <g:hiddenField name="currentWeatherCall" value="${currentLocation.currentWeatherCall}" />
                    <g:hiddenField name="fiveDayWeatherCall" value="${currentLocation.fiveDayWeatherCall}" />


                    <input class="btn btn-primary" type="submit" value="Save Location" />

                </g:form>
            </g:if>
        </div>
        <ul class="report">
            <li><a href="#">${forecastWeather.forecastDayList[0].main.temperature} °F</a></li>
            <li><a href="#"><span>${forecastWeather.forecastDayList[0].main.tempCelsius}</span> °C</a></li>
        </ul>
    </div>
    <div class="weather-right">
        <ul>
            <li>
                <figure class="icons">
                    <canvas id="partly-cloudy-day" width="30" height="30"></canvas>
                </figure>
                <h5>${dateFormatter.format(forecastWeather.forecastDayList[8].javaDate)}</h5>
                <h5>${forecastWeather.forecastDayList[8].main.temperature} °F</h5>
                <div class="clear"></div>
            </li>
            <li>
                <figure class="icons">
                    <canvas id="cloudy" width="30" height="30"></canvas>
                </figure>
                <h5>${dateFormatter.format(forecastWeather.forecastDayList[16].javaDate)}</h5>
                <h5>${forecastWeather.forecastDayList[16].main.temperature} °F</h5>
                <div class="clear"></div>
            </li>
            <li>
                <figure class="icons">
                    <canvas id="clear-day" width="30" height="30"></canvas>
                </figure>
                <h4>${dateFormatter.format(forecastWeather.forecastDayList[24].javaDate)}</h4>
                <h5>${forecastWeather.forecastDayList[24].main.temperature} °F</h5>
                <div class="clear"></div>
            </li>
            <li>
                <figure class="icons">
                    <canvas id="wind" width="30" height="30"></canvas>
                </figure>
                <h4>${dateFormatter.format(forecastWeather.forecastDayList[32].javaDate)}</h4>
                <h5>${forecastWeather.forecastDayList[32].main.temperature} °F</h5>
                <div class="clear"></div>
            </li>
        </ul>
        <script>
            var icons = new Skycons({"color": "#fff"}),
                list  = [
                    "partly-cloudy-day"
                ],
                i;

            for(i = list.length; i--; )
                icons.set(list[i], list[i]);
            icons.play();
        </script>
        <script>
            var icons = new Skycons({"color": "#fff"}),
                list  = [
                    "clear-night","partly-cloudy-night", "cloudy", "clear-day", "sleet", "snow", "wind","fog"
                ],
                i;

            for(i = list.length; i--; )
                icons.set(list[i], list[i]);
            icons.play();
        </script>
    </div>
    <div class="clear"></div>
</div>
