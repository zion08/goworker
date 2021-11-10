package bean;

import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.util.Date;

public class NewPassword {
	static SecureRandom secureRandomGenerator;
		
	public String getSecureRandomPassword(int size){
		char[] charSet=new char[size];
		StringBuffer sb = new StringBuffer();
		try
		{ 
			secureRandomGenerator = SecureRandom.getInstance("SHA1PRNG", "SUN"); // secureRandom 숫자 생성.
		} 
		catch (NoSuchAlgorithmException | NoSuchProviderException e ) 
		{	
			e.printStackTrace();
		}	
		int random = 0;
		int len = charSet.length;
		for(int i=0; i<size;i++) 
		{
			random = secureRandomGenerator.nextInt(len);
			sb.append(random);
		}
		return sb.toString(); 
	}
}
