package com.dfong.security.util;

import org.springframework.security.crypto.password.PasswordEncoder;

public class PassthruEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
	
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		// TODO Auto-generated method stub
		return encodedPassword.equals(rawPassword);
	}

}
