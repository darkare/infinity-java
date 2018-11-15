package com.dfong.security.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class MyUtility {

	public static String encodeBCrypt(String aValue) {
		return (aValue == null? null: new BCryptPasswordEncoder().encode(aValue));
	}
	
}