package tiger.api.testreviewsession;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

	
	public class ReviewDataGenerator {

		public static String getEmail() {
			Faker faker = new Faker();
			return faker.name().firstName() + faker.name().lastName() + "@gmail.com";

		}

		public static String getPhoneNumber() {
			Faker faker = new Faker();
			return faker.phoneNumber().cellPhone();

		}

		public static String getFirstName() {
			Faker faker = new Faker();
			return faker.name().firstName();

		}

		public static String getLastName() {
			Faker faker = new Faker();
			return faker.name().lastName();
			
		}

		public static String getDob() {
			Faker faker = new Faker();
			Date date = faker.date().birthday();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			return format.format(date);
		
		}
	
		
		
		public static String getAddressLine1() {
			Faker faker = new Faker();
			return faker.address().streetAddress();
			
		}
			
		public static String getCity() {
			Faker faker = new Faker();
			return faker.address().city();
		}
		
		public static String getState() {
			Faker faker = new Faker();
			return faker.address().state();
		}
		
		public static String getPostalCode() {
			Faker faker = new Faker();
			return faker.address().zipCode();
			
		}
			
		public static String getCountryCode() {
			Faker faker = new Faker();
			return faker.address().countryCode();
		}
	}
		
		
		
		
		
		