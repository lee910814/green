package com.avengors.utils;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class Hash {

	public static String getHash(String input) {
		String hash = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			md.reset();
			md.update(input.getBytes("UTF-8"));
			hash = String.format("%0128x", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return hash;
	}
	
	public static String getSalt() {
		SecureRandom random;
		String salt = "";
		try {
			random = SecureRandom .getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			salt = new String(Base64.getEncoder().encode(bytes));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return salt;
	}
	
	
}
