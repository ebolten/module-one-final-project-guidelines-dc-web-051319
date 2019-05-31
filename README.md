## DESCRIPTION
Frugal Travel is an application that is designed to help people find travel options and destinations within their price range. They can select whether they would like to travel internationally, what type of transportation method they would like to use, and be given options of cities and prices based on their preferences.

Once the user enters their info, their data will be written to the database table "travellers." Then, once the choose their destination, it will be put in a table as well called "destinations." Finally, the last database called "bookings" will save their booking (price they paid, their traveller id, their destination id and their chosen method of transportation).

## FEATURES OF THE APP
- User is able to select their method of transportation and the price will vary depending on the one they choose.
- User is able to enter their city and country and choose whether they would like to travel internationally. If not, the app will only select cities within their country.
- User is able to enter their budget and the app will show them cities they can travel to based on their budget.
- User is able to see the city they travelled from, their destination city, and the currency their new destination will use.

## SOMETHING WE STRUGGLED TO BUILD. . .
We struggled mostly with learning how to depend on ActiveRecord instead of manually writing the methods out. One of those examples would be defining the many-to-many relationships without manually coding them, but using macros instead. The initializer methods were already created with ActiveRecord and the columns of the database, therefore we ran into a few erros once we tried to manually define those methods.

## 3 THINGS WE LEARNED
1. We learned how to depend on ActiveRecord to create the methods we'd gotten used to manually creating. Examples would be defining our many-to-many class relationships, our methods with ORM to connect our classes to the databases, and others.

2. We learned how to shorten our methods by using helper methods and dividing our methods by their individual functions rather than putting more than one use in each method. Therefore, at the end of our project, we had cleaner code to work with.

3. We learned how to design and polish an app for the user experience. The command-line-interface was important for the user to understand and use our app, therefore, the design was important.

## THINGS WE WOULD CHANGE
If we could change something about our app, it would be to incorporate APIs into our data. For the app, we seeded our own data, therefore it is not representative of reality. If we added APIs, however, somebody could really use our app to find a flight within their budget. If we had more time and knew more about APIs, we would replace our seeded data with the data retrieved from the API.