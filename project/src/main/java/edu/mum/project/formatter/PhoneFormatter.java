package edu.mum.project.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import edu.mum.project.domain.Phone;

@Component
public class PhoneFormatter implements Formatter<Phone>{
	@Override
	public String print(Phone phone, Locale arg1) {
		return phone.getArea()+phone.getPrefix()+phone.getNumber()+"";
	}

	@Override
	public Phone parse(String phone, Locale arg1) throws ParseException {
		// TODO Auto-generated method stub
		int area=Integer.parseInt(phone.substring(0,3));
		int prefix=Integer.parseInt(phone.substring(3,6));
		int number=Integer.parseInt(phone.substring(6,10));
		return new Phone(area,prefix,number);
	}
}
