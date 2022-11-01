package com.kiwi.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.NumberFormat;
import java.util.Locale;

/**
 * 格式化数据
 * 
 */
public class FormatData {

	public static String showMoney(double money) {
		return showMoney(money, Locale.CHINA);
	}

	public static String showMoney(double money, Locale locale) {
		NumberFormat num = NumberFormat.getCurrencyInstance(locale);
		return num.format(money);
	}

	public static String showNumber(double num, int decimal) {
		return showNumber(num, decimal, Locale.CHINA);
	}

	public static String showNumber(double num, int decimal, Locale locale) {
		NumberFormat nf = NumberFormat.getInstance(locale);
		nf.setMaximumFractionDigits(decimal);
		return nf.format(num);
	}

	public static String showPercent(double num, int decimal) {
		return showPercent(num, decimal, Locale.CHINA);
	}

	public static String showPercent(double num, int decimal, Locale locale) {
		NumberFormat nf = NumberFormat.getPercentInstance(locale);
		nf.setMaximumFractionDigits(decimal);
		return nf.format(num);
	}

	/**    
     * MD5 加密    
     */      
    public static String getMD5(String param) {      
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            if (null == param){
            	param = "";
            }
            messageDigest.update(param.getBytes("UTF-8")); 
        } catch (NoSuchAlgorithmException e) {
            System.out.println("NoSuchAlgorithmException caught!");
            System.exit(-1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
      
        byte[] byteArray = messageDigest.digest();
      
        StringBuffer md5StrBuff = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {     
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1){
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
            } else {
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
            }
        }

        return md5StrBuff.toString();
    } 
}
