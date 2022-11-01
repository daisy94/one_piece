package com.kiwi.utils;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.ByteBuffer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

public class TypeUtil {

	/**
	 * 转换为字符串,如果是null则返回""
	 * 
	 * @param value
	 *            要转换的值
	 * @return 字符串
	 */
	public static String toString(Object value) {
		return toString(value, "");
	}

	/**
	 * 转换为字符串,如果是null则返回returnValue
	 * 
	 * @param value
	 *            要转换的值
	 * @param returnValue
	 *            null时的返回值
	 * @return 字符串
	 */
	public static String toString(Object value, String returnValue) {
		if (null == value) {
			return returnValue;
		} else {
			return value.toString();
		}
	}

	/**
	 * 将对象转换为整型
	 * 
	 * @param value
	 *            欲转换的对象
	 * @return 整型数字
	 */
	public static Integer toInt(Object value) {
		return toInt(value, null);
	}

	/**
	 * 将对象转换为整型
	 * 
	 * @param value
	 *            欲转换的对象
	 * @param nullReturn
	 *            如对象=null 应返回的值
	 * @return 整型数字
	 */
	public static Integer toInt(Object value, Integer i) {
		try {
			if (null == value || "".equals(value.toString())) {
				return i;
			} else {
				if (value instanceof Long) {
					return ((Long) value).intValue();
				} else if (value instanceof Integer) {
					return ((Integer) value).intValue();
				} else if (value instanceof Short) {
					return ((Short) value).intValue();
				} else if (value instanceof Byte) {
					return ((Byte) value).intValue();
				} else if (value instanceof Double) {
					return ((Double) value).intValue();
				} else {
					return Integer.parseInt(value.toString());
				}
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 将对象转换为不小于value / value2的整型
	 * 
	 * @param value
	 *            欲转换的对象
	 * @param nullReturn
	 *            如对象=null 应返回的值
	 * @return 整型数字
	 */
	public static Integer toCeil(Integer value, Integer value2) {
		try {
			if (null == value || null == value2) {
				return null;
			} else {
				if (value % value2 > 0) return value / value2 + 1;
				else return value / value2;
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 将对象转换为Long型
	 * 
	 * @param value
	 *            欲转换的对象
	 * @return long型数字
	 */
	public static Long toLong(Object value) {
		try {
			if (null == value || "".equals(value.toString())) {
				return null;
			} else {
				if (value instanceof Long) {
					return ((Long) value).longValue();
				} else if (value instanceof Integer) {
					return ((Integer) value).longValue();
				} else if (value instanceof Short) {
					return ((Short) value).longValue();
				} else if (value instanceof Byte) {
					return ((Byte) value).longValue();
				} else if (value instanceof Double) {
					return ((Double) value).longValue();
				} else {
					return Long.parseLong(value.toString());
				}
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 将对象转成float型
	 * 
	 * @param value
	 *            要转换的对象
	 * @return float型
	 */
	public static Float toFloat(Object value) {
		return toFloat(value, null);
	}
	
	/**
	 * 将对象转成float型并乘以倍率
	 * 
	 * @param value
	 *            要转换的对象
	 * @param d
	 *            倍率
	 * @return float型
	 */
	public static Float toFloat(Object value, Float d) {
		try {
			if (null == value || "".equals(value.toString())) {
				return d;
			} else {
				if (value instanceof Long) {
					return ((Long) value).floatValue();
				} else if (value instanceof Integer) {
					return ((Integer) value).floatValue();
				} else if (value instanceof Short) {
					return ((Short) value).floatValue();
				} else if (value instanceof Byte) {
					return ((Byte) value).floatValue();
				} else if (value instanceof Float) {
					return ((Float) value).floatValue();
				} else {
					return Float.parseFloat(Replace(value.toString(),",",""));
				}
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 将对象转成double型
	 * 
	 * @param value
	 *            要转换的对象
	 * @return double型
	 */
	public static Double toDouble(Object value) {
		return toDouble(value, null);
	}

	/**
	 * 将对象转成double型并乘以倍率
	 * 
	 * @param value
	 *            要转换的对象
	 * @param d
	 *            倍率
	 * @return double型
	 */
	public static Double toDouble(Object value, Double d) {
		try {
			if (null == value || "".equals(value.toString())) {
				return d;
			} else {
				if (value instanceof Long) {
					return ((Long) value).doubleValue();
				} else if (value instanceof Integer) {
					return ((Integer) value).doubleValue();
				} else if (value instanceof Short) {
					return ((Short) value).doubleValue();
				} else if (value instanceof Byte) {
					return ((Byte) value).doubleValue();
				} else if (value instanceof Double) {
					return ((Double) value).doubleValue();
				} else {
					return Double.parseDouble(Replace(value.toString(),",",""));
				}
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 将对象转成double型保持两位小数
	 * 
	 * @param value
	 *            要转换的对象
	 * @param returnValue
	 *            默认返回值
	 * @return double型
	 */
	public static Double toNumber(Object value) {
		return toNumber(value, null);
	}

	/**
	 * 将对象转成double型保持两位小数
	 * 
	 * @param value
	 *            要转换的对象
	 * @param returnValue
	 *            默认返回值
	 * @return double型
	 */
	public static Double toNumber(Object value, Double returnValue) {
		try {
			String number;
			if (null == value || "".equals(value.toString())) {
				return returnValue;
			} else {
				if (value instanceof Long) {
					number = FormatData.showNumber(((Long) value).doubleValue(), 2);
				} else if (value instanceof Integer) {
					number = FormatData.showNumber(((Integer) value).doubleValue(), 2);
				} else if (value instanceof Short) {
					number = FormatData.showNumber(((Short) value).doubleValue(), 2);
				} else if (value instanceof Byte) {
					number = FormatData.showNumber(((Byte) value).doubleValue(), 2);
				} else if (value instanceof Double) {
					number = FormatData.showNumber(((Double) value).doubleValue(), 2);
				} else {
					number = FormatData.showNumber(Double.parseDouble(value.toString()), 2);
				}
				return Double.parseDouble(Replace(number,",",""));
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 将对象转成double型保持decimal小数
	 * 
	 * @param value
	 *            要转换的对象
	 * @param decimal
	 *            小数位数
	 * @return double型
	 */
	public static Double toNumber(Object value, int decimal) {
		try {
			String number;
			if (null == value || "".equals(value.toString())) {
				return null;
			} else {
				if (value instanceof Long) {
					number = FormatData.showNumber(((Long) value).doubleValue(), decimal);
				} else if (value instanceof Integer) {
					number = FormatData.showNumber(((Integer) value).doubleValue(), decimal);
				} else if (value instanceof Short) {
					number = FormatData.showNumber(((Short) value).doubleValue(), decimal);
				} else if (value instanceof Byte) {
					number = FormatData.showNumber(((Byte) value).doubleValue(), decimal);
				} else if (value instanceof Double) {
					number = FormatData.showNumber(((Double) value).doubleValue(), decimal);
				} else {
					number = FormatData.showNumber(Double.parseDouble(value.toString()), decimal);
				}
				return Double.parseDouble(Replace(number,",",""));
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 将对象转换为短整型
	 * 
	 * @param value
	 *            欲转换的对象
	 * @param nullReturn
	 *            如对象=null 应返回的值
	 * @return 短整型数字
	 */
	public static Short toShort(Object value) {
		try {
			if (null == value || "".equals(value.toString())) {
				return null;
			} else {
				if (value instanceof Long) {
					return ((Long) value).shortValue();
				} else if (value instanceof Integer) {
					return ((Integer) value).shortValue();
				} else if (value instanceof Short) {
					return ((Short) value).shortValue();
				} else if (value instanceof Byte) {
					return ((Byte) value).shortValue();
				} else if (value instanceof Double) {
					return ((Double) value).shortValue();
				} else {
					return Short.parseShort(value.toString());
				}
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 将对象转换为byte型
	 * 
	 * @param value
	 *            欲转换的对象
	 * @param nullReturn
	 *            如对象=null 应返回的值
	 * @return byte型数字
	 */
	public static Byte toByte(Object value) {
		try {
			if (null == value || "".equals(value.toString())) {
				return null;
			} else {
				if (value instanceof Long) {
					return ((Long) value).byteValue();
				} else if (value instanceof Integer) {
					return ((Integer) value).byteValue();
				} else if (value instanceof Short) {
					return ((Short) value).byteValue();
				} else if (value instanceof Byte) {
					return ((Byte) value).byteValue();
				} else if (value instanceof Double) {
					return ((Double) value).byteValue();
				} else {
					return Byte.parseByte(value.toString());
				}
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 减法
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toSub(Object value1, Object value2) {
		try {
			if (null == value1 || null == value2) {
				return null;
			} else {
				Double minuend = toDouble(value1);
				Double subtrahend = toDouble(value2);
				return (minuend-subtrahend);
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 加法
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toAdd(Object value1, Object value2) {
		try {
			if (null != value1 && null != value2) {
				return (toDouble(value1)+toDouble(value2));
			} else if (null != value1) {
				return toDouble(value1);
			} else if (null != value2) {
				return toDouble(value2);
			} else {
				return null;
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 乘法
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toMul(Object value1, Object value2) {
		try {
			if (null == value1 || null == value2) {
				return null;
			} else {
				double multiplier1 = toDouble(value1);
				double multiplier2 = toDouble(value2);
				return (multiplier1*multiplier2);
			} 

		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 乘法
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toMul(Object value1, Object value2, Object value3) {
		try {
			if (null == value1 || null == value2 || null == value3) {
				return null;
			} else {
				double multiplier1 = toDouble(value1);
				double multiplier2 = toDouble(value2);
				double multiplier3 = toDouble(value3);
				return (multiplier1*multiplier2*multiplier3);
			} 

		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 乘法格式化
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toMulFormat(Object value1, Object value2) {
		try {
			if (null == value1 || null == value2) {
				return null;
			} else {
				double multiplier1 = toDouble(value1);
				double multiplier2 = toDouble(value2);
				return (toNumber(multiplier1*multiplier2));
			} 

		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 除法
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toDivision(Object value1, Object value2) {
		try {
			if (null == value1 || null == value2) {
				return null;
			} else if (toDouble(value2) == 0) {
				return null;
			} else {
				Double dividend = toDouble(value1);
				Double divisor = toDouble(value2);
				return (dividend/divisor);
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 除法格式化
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toDivFormat(Object value1, Object value2) {
		try {
			if (null == value1 || null == value2) {
				return null;
			} else if (toDouble(value2) == 0) {
				return null;
			} else {
				Double dividend = toDouble(value1);
				Double divisor = toDouble(value2);
				return (toNumber(dividend/divisor));
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 百分比
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static String toPercent(Object value1, Object value2) {
		try {
			if (null == value1 || null == value2) {
				return null;
			} else if (toDouble(value2) == 0) {
				return null;
			} else {
				Double dividend = toDouble(value1);
				Double divisor = toDouble(value2);
				return FormatData.showPercent((dividend / divisor), 2);
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	/**
	 * 增长率
	 * @param value1
	 * @param value2
	 * @return
	 */
	public static Double toRate(Object value1, Object value2) {
		try {
			if (null == value1 || null == value2 || 0 == toDouble(value2)) {
				return null;
			} else {
				Double minuend = toDouble(value1);
				Double subtrahend = toDouble(value2);
				return TypeUtil.toDouble(FormatData.showNumber(((minuend-subtrahend) / subtrahend)*100, 2));
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}

	/**
	 * 将对象转换为Boolean型
	 * 
	 * @param value
	 *            欲转换的对象
	 * @param nullReturn
	 *            如对象=null 应返回的值
	 * @return byte型数字
	 */
	public static Boolean toBoolean(Object value) {
		if (null == value || "".equals(value.toString())) {
			return null;
		} else if (value instanceof Boolean) {
			return (Boolean) value;
		} else if (toByte(value) > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 对象转换为日期
	 * 
	 * @param value
	 * @return
	 */
	public static Date toDate(Object value) {
		Date date = null;
		if (null == value || "".equals(value.toString())) {
			return null;
		} else {
			try {
				String strFormat = "yyyy-MM-dd";
				SimpleDateFormat df = new SimpleDateFormat(strFormat);
				date = df.parse(value.toString());
			} catch (Exception e) {
				return null;
			}
			return date;
		}
	}

	/**
	 * 对象转换为日期时间(24小时制)
	 * 
	 * @throws ParseException
	 */
	public static Date toDateTime(Object value) {
		Date date = null;
		if (null == value || "".equals(value.toString())) {
			return null;
		} else {
			try {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				date = df.parse(value.toString());
			} catch (Exception e) {
				return null;
			}
			return date;
		}
	}

	/**
	 * 表名、字段名和字段个数生成字段系列（如功率曲线等）
	 * 
	 * @param fieldName
	 * @param fieldCount
	 * @return
	 */
	public static String toFields(String fieldName, int fieldCount) {
		StringBuffer fields = new StringBuffer();
		int interval = 96 / fieldCount;
		for (int i = 0; i < fieldCount; i++) {
			fields.append("," + fieldName + (i * interval + 1));
		}
		return fields.toString();
	}

	/**
	 * 表名、字段名和字段个数生成字段系列（如功率曲线等）
	 * 
	 * @param fieldName
	 * @param fieldCount
	 * @param method
	 * @return
	 */
	public static String toFields(String fieldName, int fieldCount, String method) {
		StringBuffer fields = new StringBuffer();
		int interval = 96 / fieldCount;
		for (int i = 0; i < fieldCount; i++) {
			fields.append("," + method + "(" + fieldName + (i * interval + 1) + ")");
		}
		return fields.toString();
	}

	/**
	 * 表名、字段名和字段个数生成字段系列（如电表功率曲线，需要乘以综合倍率）
	 * 
	 * @param fieldName
	 * @param fieldCount
	 * @param method
	 * @return
	 */
	public static String toFieldsP(String fieldName, int fieldCount, String method, String otherfieldName, String operate) {
		StringBuffer fields = new StringBuffer();
		int interval = 96 / fieldCount;
		for (int i = 0; i < fieldCount; i++) {
			fields.append("," + method + "(" + fieldName + (i * interval + 1) + operate + otherfieldName + ")");
		}
		return fields.toString();
	}

	/**
	 * 表名、字段名和字段个数生成字段系列（用于示值相减，后一点减去前一点再乘以综合倍率）
	 * 
	 * @param fieldName
	 * @param fieldCount
	 * @param method
	 * @return
	 */
	public static String toFields(String fieldName, int fieldCount, String method, String otherfieldName, String operate) {
		StringBuffer fields = new StringBuffer();
		int interval = 96 / fieldCount;
		for (int i = 0; i < fieldCount - 1; i++) {
			fields.append("," + method + "((" + fieldName + ((i + 1) * interval + 1) + "-" + fieldName + (i * interval + 1) + ")" + operate + otherfieldName + ")");
		}
		return fields.toString();
	}

	/**
	 * '功能：替换字符串 '输入：strSource - 欲处理的字符串。findStr - 欲被替换的字符串，strTo - 替换字符串
	 * '输出：处理后的字符串 '示例：strTemp = strToReplace("12,5,453,2h,3,8",",","0") 返回结果
	 * 1205045302h0308
	 */
	public static String Replace(String strSource, String strFrom, String strTo) {
		if (strSource == null || strSource.equals("")) {
			return "";
		}
		int i = 0;
		if ((i = strSource.indexOf(strFrom, i)) >= 0) {
			char[] cSrc = strSource.toCharArray();
			char[] cTo = strTo.toCharArray();
			int len = strFrom.length();
			StringBuffer buf = new StringBuffer(cSrc.length);
			buf.append(cSrc, 0, i).append(cTo);
			i += len;
			int j = i;
			while ((i = strSource.indexOf(strFrom, i)) > 0) {
				buf.append(cSrc, j, i - j).append(cTo);
				i += len;
				j = i;
			}
			buf.append(cSrc, j, cSrc.length - j);
			return buf.toString();
		}
		return strSource;
	}

	/**
	 * 字符串以splitSign分割的每个字串是否在strTo中
	 * 
	 * @param strFrom
	 * @param strTo
	 * @param splitSign
	 * @return
	 */
	public static boolean toExist(String strFrom, String strTo, String splitSign) {
		int index;
		if (null == strFrom || null == strTo || null == splitSign || "".equals(strFrom) || "".equals(strTo)) {
			return false;
		}
		strTo += splitSign;
		if (strTo.indexOf(strFrom + splitSign) != -1) {
			return true;
		}
		while ((index = strFrom.indexOf(splitSign)) != -1) {
			if (strTo.indexOf(strFrom.substring(0, index + splitSign.length())) != -1) {
				return true;
			}
			strFrom = strFrom.substring(index + splitSign.length());
		}
		return false;
	}
	
	/**
	 * 截取固定长度的字符串
	 * @param s
	 *            要截取的字符串
	 * @param length
	 *            要截取字符串的长度->是字节一个汉字2个字节 return 返回length长度的字符串（含汉字）
	 */
	public static String bSubstring(String s, int length, String more) {
		if (null == s) {
			return "";
		}
		try{
			byte[] bytes = s.getBytes("Unicode");
			int n = 0; // 表示当前的字节数
			int i = 2; // 要截取的字节数，从第3个字节开始
			for (; i < bytes.length && n < length; i++) {
				// 奇数位置，如3、5、7等，为UCS2编码中两个字节的第二个字节
				if (i % 2 == 1) {
					n++; // 在UCS2第二个字节时n加1
				} else {
					// 当UCS2编码的第一个字节不等于0时，该UCS2字符为汉字，一个汉字算两个字节
					if (bytes[i] != 0) {
						n++;
					}
				}
			}
			// 如果i为奇数时，处理成偶数
			/*
			 * if (i % 2 == 1){ // 该UCS2字符是汉字时，去掉这个截一半的汉字 if (bytes[i - 1] != 0) i =
			 * i - 1; // 该UCS2字符是字母或数字，则保留该字符 else i = i + 1; }
			 */
			// 将截一半的汉字要保留
			if (i % 2 == 1) {
				i = i + 1;
			}
			return new String(bytes, 0, i, "Unicode");
		} catch(Exception re){
			return "";
		}
	}
	
	/**
	 * 分割字符串
	 * 
	 * @param str
	 *            String 原始字符串
	 * @param splitsign
	 *            String 分隔符
	 * @return String[] 分割后的字符串数组
	 */
	public static String[] split(String str, String splitsign) {
		int index;
		if (str == null || splitsign == null)
			return null;
		ArrayList<String> al = new ArrayList<String>();
		while ((index = str.indexOf(splitsign)) != -1) {
			al.add(str.substring(0, index));
			str = str.substring(index + splitsign.length());
		}
		al.add(str);
		return (String[]) al.toArray(new String[0]);
	}
	
	/**
	 * 深度复制
	 * @param src
	 * @return
	 * @throws IOException
	 * @throws ClassNotFoundException
	 */
	public static <T> List<T> deepCopy(List<T> src) {   
		try{
		    ByteArrayOutputStream byteOut = new ByteArrayOutputStream();   
		    ObjectOutputStream out = new ObjectOutputStream(byteOut);   
		    out.writeObject(src);   
		  
		    ByteArrayInputStream byteIn = new ByteArrayInputStream(byteOut.toByteArray());   
		    ObjectInputStream in = new ObjectInputStream(byteIn);   
		    @SuppressWarnings("unchecked")   
		    List<T> dest = (List<T>) in.readObject();   
		    return dest;
		} catch(IOException ioe) {
			ioe.printStackTrace();
		} catch(ClassNotFoundException cne) {
			cne.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 对象为空转换为零
	 * @param value
	 * @return
	 */
	public static Object nullToZ(Object value)
	{
		if(null==value)
		{
			return 0;
		}
		else
		{
			return value;
		}
	}
	/**
	 * 浮点型数值转换为字节数组
	 * @param f
	 * @return
	 */
	public static byte[] float2byte(float f) {
		ByteBuffer bbuf = ByteBuffer.allocate(4);
		bbuf.putFloat(f);
		byte[] data = bbuf.array();
//		ArrayList<Byte> al = new ArrayList<Byte>();
//		for (int i = data.length - 1; i >= 0; i--) {
//			al.add(data[i]);
//		}

//		byte[] buffer = new byte[al.size()];
		int length = data.length;
		byte[] buffer = new byte[length];
		for (int i = 0; i <= length - 1; i++) {
			buffer[i] = data[length - 1 - i];
		}
		return buffer;
	}
	
	/**
	 * 字节数组转换为浮点型数值
	 * @param b
	 * @param index
	 * @return
	 */
    public static float byte2float(byte[] b, int index) {    
        int l;                                             
        l = b[index + 0];                                  
        l &= 0xff;                                         
        l |= ((long) b[index + 1] << 8);                   
        l &= 0xffff;                                       
        l |= ((long) b[index + 2] << 16);                  
        l &= 0xffffff;                                     
        l |= ((long) b[index + 3] << 24);                  
        return Float.intBitsToFloat(l);                    
    }
    
	/**
	 * 判断是否为数字
	 * @param value
	 * @return
	 */
	public static boolean isNumber(Object value) {
		try {
			if (null == value || "".equals(value.toString())) {
				return false;
			}
			Pattern pattern = Pattern.compile("-?[0-9]+.?[0-9]+");
			return pattern.matcher(value.toString()).matches(); 
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
    public static int ipToInt(String strIp) {  
        int[] ip = new int[4];  
        // 先找到IP地址字符串中.的位置  
        int position1 = strIp.indexOf(".");  
        int position2 = strIp.indexOf(".", position1 + 1);  
        int position3 = strIp.indexOf(".", position2 + 1);  
        // 将每个.之间的字符串转换成整型  
        ip[0] = Integer.parseInt(strIp.substring(0, position1));  
        ip[1] = Integer.parseInt(strIp.substring(position1 + 1, position2));  
        ip[2] = Integer.parseInt(strIp.substring(position2 + 1, position3));  
        ip[3] = Integer.parseInt(strIp.substring(position3 + 1));  
        return (int)((ip[3] << 24) + (ip[2] << 16) + (ip[1] << 8) + ip[0] - 2147483648L);  
    } 
    
    // 将十进制整数形式转换成127.0.0.1形式的ip地址  
    public static String intToIP(Integer intIp) {
    	if (null == intIp) return "";
    	long lonIp = intIp + 2147483648L;
	  	int bytIp4 = (int)((lonIp / 16777216) % 256);
	  	int bytIp3 = (int)((lonIp / 65536) % 256);
	  	int bytIp2 = (int)((lonIp / 256) % 256);
	  	int bytIp1 = (int)(lonIp % 256);
	  	return TypeUtil.toString(bytIp1) + "." + TypeUtil.toString(bytIp2) + "." + TypeUtil.toString(bytIp3) + "." + TypeUtil.toString(bytIp4); 
    }
    
	/**
	 * 处理字符串转换为固定长度（不足补0）
	 * @param param
	 * @param tlength	固定长度
	 * @param position	0前补1后补
	 * @return
	 */
	public static String castString(String param, int tlength, int position) {
		String rtn;
		if (null == param) {
			rtn = "";
		} else {
			rtn = param;
		}
		int length = rtn.length();//长度
		length = tlength - length;
		for(int i = 0;i < length;i++) {
			if (0 == position) rtn = "0" + rtn;
			if (1 == position) rtn = rtn + "0";
		}
		return rtn;
	}
	
	/**
	 * unicode转换中文
	 * @param utfString
	 * @return
	 */
	public static String unicodeConvert(String utfString){  
	    StringBuilder sb = new StringBuilder();  
	    int i = -1;  
	    int pos = 0;  
	    while((i=utfString.indexOf("\\u", pos)) != -1){  
	        sb.append(utfString.substring(pos, i));  
	        if(i+5 < utfString.length()){  
	            pos = i+6;  
	            sb.append((char)Integer.parseInt(utfString.substring(i+2, i+6), 16));  
	        }  
	    }
	    return sb.toString();  
	}
	
	/***
	 * Unicode编码汉字转化
	 * @param theString
	 * @return
	 */
	public static String decodeUnicode(String theString) {
		char aChar;
		int len = theString.length();
		StringBuffer outBuffer = new StringBuffer(len);
		for (int x = 0; x < len;) {
			aChar = theString.charAt(x++);
			if (aChar == '\\') {
				aChar = theString.charAt(x++);
				if (aChar == 'u') {
					// Read the xxxx
					int value = 0;
					for (int i = 0; i < 4; i++) {
						aChar = theString.charAt(x++);
						switch (aChar) {
						case '0':
						case '1':
						case '2':
						case '3':
						case '4':
						case '5':
						case '6':
						case '7':
						case '8':
						case '9':
							value = (value << 4) + aChar - '0';
							break;
						case 'a':
						case 'b':
						case 'c':
						case 'd':
						case 'e':
						case 'f':
							value = (value << 4) + 10 + aChar - 'a';
							break;
						case 'A':
						case 'B':
						case 'C':
						case 'D':
						case 'E':
						case 'F':
							value = (value << 4) + 10 + aChar - 'A';
							break;
						default:
							throw new IllegalArgumentException("Malformed   \\uxxxx   encoding.");
						}
					}
					outBuffer.append((char) value);
				} else {
					if (aChar == 't')
						aChar = '\t';
					else if (aChar == 'r')
						aChar = '\r';
					else if (aChar == 'n')
						aChar = '\n';
					else if (aChar == 'f')
						aChar = '\f';
					outBuffer.append(aChar);
				}
			} else
				outBuffer.append(aChar);
		}
		return outBuffer.toString();
	}
	
	/**
	 * 规约日志
	 * @param b
	 * @return
	 */
	public static String printHexString(byte[] b)
    {
		String abc = "";
		for (int i = 0; i < b.length; i++) {
			if ((i % 16 == 0) && (i % 32 != 0) && (i != 0)) {
				abc += "-";
			}
			if (i % 32 == 0) {
				abc += "\n";
			}
			String hex = Integer.toHexString(b[i] & 0xFF);
			if (hex.length() == 1) {
				hex = '0' + hex;
			}
			abc += hex.toUpperCase() + " ";

		}
		return abc;
    }
	
	public static Date toDate1(Object value) {
		Date date = null;
		if (null == value || "".equals(value.toString())) {
			return null;
		} else {
			try {
				String strFormat = "yyyyMMdd";
				SimpleDateFormat df = new SimpleDateFormat(strFormat);
				date = df.parse(value.toString());
			} catch (Exception e) {
				return null;
			}
			return date;
		}
	}
}