package bean;

import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;

public class NewPassword {
	static SecureRandom secureRandomGenerator;
		
	public String getSecureRandomPassword(int size){
		char[] charSet=new char[size];// charSet에 저장할 숫자 크기
		StringBuffer sb = new StringBuffer();// 연속되는 문자를 저장할 문자열 버퍼 선언
		try
		{ 
			secureRandomGenerator = SecureRandom.getInstance("SHA1PRNG", "SUN"); // secureRandom 숫자 생성.
		} 
		catch (NoSuchAlgorithmException | NoSuchProviderException e ) // 알고리즘 에러, 프로바이더 에러 처리.
		{	
			e.printStackTrace();
		}	
		int random = 0;// 랜덤 번호 저장할 변수
		int len = charSet.length;// sharSet 길이 저장 
		for(int i=0; i<5;i++) // n번 돌림 
		{
			random = secureRandomGenerator.nextInt(len);// 0<=i<499까지의 번호 중 랜덤하게 추출
			sb.append(random);// 스트링버퍼에 랜덤하게 뽑힘 숫자를 저장-추가
		}
		return sb.toString(); // 스트링버퍼형 변수를 toString메서드로 출력 
	}
}
