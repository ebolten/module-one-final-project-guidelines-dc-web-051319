#returns the hash of cities to travel to by plane
def city_hash_planes
    cities = {
        "Tokyo, Japan" => 920,
        "Sapporo, Japan" => 1700,
        "Seattle Washington, United States" => 180,
        "New York City, United States" => 370,
        "Istanbul, Turkey" => 526,
        "Düsseldorf, Germany" => 513, 
        "Austin Texas, United States" => 400,
        "Miraflores, Peru" => 330,
        "Luxembourg City, Luxembourg" => 1200,
        "London, United Kingdom" => 640,
        "Tunis, Tunisia" => 900,
        "Havana, Cuba" => 440,
        "St. Petersburg, Russia" => 990,
        "Kiev, Ukraine" => 755,
        "Prague, Czech Republic" => 500,
        "Vienna, Austria" => 460,
        "Jerusalem, Israel" => 1300,
        "Ottawa, Canada" => 200,
        "Vancouver, Canada" => 262,
        "New Delhi, India" => 1000,
        "Bogotá, Colombia" => 390,
        "Milan, Italy" => 790,
        "Rome, Italy" => 900,
        "Amelia, Italy" => 290,
        "Barcelona, Spain" => 800,
        "Reykjavík, Iceland" => 500,
        "Shanghai, China" => 1200,
        "Amsterdam, Netherlands" => 650
    }
    return cities
end