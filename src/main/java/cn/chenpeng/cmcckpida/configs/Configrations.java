package cn.chenpeng.cmcckpida.configs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

import cn.chenpeng.cmcckpida.date.DateHandle;

/**
 * 本类将/Config文件夹下所有的.properties文件加载，并将配置放入到相应的容器中
 * 
 * @author ChenPeng
 *
 */
public class Configrations {

	private static Map<String, Properties> appcfgmap;

	private static String APPPATH;
	/**
	 * 使用一个静态代码块，在类加载时即将配置文件加载进内存中
	 */
	static {

		APPPATH = System.getProperty("user.dir");
		File appPropFile = new File(APPPATH + System.getProperty("file.separator") + "Config"
				+ System.getProperty("file.separator") + "application-cfg.properties");
		File oraPropFile = new File(APPPATH + System.getProperty("file.separator") + "Config"
				+ System.getProperty("file.separator") + "oracle-cfg.properties");
		File sftpPropFile = new File(APPPATH + System.getProperty("file.separator") + "Config"
				+ System.getProperty("file.separator") + "sftp-cfg.properties");

		Properties appProp = new Properties();
		Properties oraProp = new Properties();
		Properties sftpProp = new Properties();

		try {

			appProp.load(new InputStreamReader(new FileInputStream(appPropFile), "utf-8"));
			System.out.println(appPropFile.getName());
			System.out.println("--------------------------------");
			System.out.println("	OMC数量：	" + appProp.getProperty("omcnum"));
			System.out.println("	数据文件种类：	" + appProp.getProperty("datatypenum"));
			System.out.println("	SQL文件种类：	" + APPPATH + System.getProperty("file.separator")
					+ appProp.getProperty("sqlscriptpath"));
			System.out.println(
					"	数据文件路径：	" + APPPATH + System.getProperty("file.separator") + appProp.getProperty("datapath"));
			System.out.println();
			oraProp.load(new InputStreamReader(new FileInputStream(oraPropFile), "utf-8"));
			System.out.println(oraPropFile.getName());
			System.out.println("--------------------------------");
			System.out.println("	日期模式：	" + oraProp.getProperty("date"));
			System.out.println("	开始日期：	" + oraProp.getProperty("start"));
			System.out.println("	结束日期：	" + oraProp.getProperty("end"));
			System.out.println();
			sftpProp.load(new InputStreamReader(new FileInputStream(sftpPropFile), "utf-8"));
			System.out.println(sftpPropFile.getName());
			System.out.println("--------------------------------");
			System.out.println("	目标主机：	" + sftpProp.getProperty("host"));
			System.out.println("	上传根目录：	" + sftpProp.getProperty("rootpath"));
			System.out.println();
			appProp.setProperty("appPath", APPPATH);
			appcfgmap = new TreeMap<String, Properties>();

			appcfgmap.put("appProp", appProp);
			appcfgmap.put("oraProp", oraProp);
			appcfgmap.put("sftpProp", sftpProp);
			/**
			 * 测试
			 */
			/*
			 * Set<Entry<Object, Object>> set = appProp.entrySet(); Iterator<Entry<Object,
			 * Object>> it = set.iterator(); while(it.hasNext()) { Entry<Object, Object>
			 * entry = it.next(); System.out.println(entry.getKey()+"="+entry.getValue()); }
			 */

		} catch (FileNotFoundException e) {
			throw new RuntimeException("Configurations not found!");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 获取其中的关于应用的配置信息容器
	 * 
	 * @return
	 */
	public Properties getAppCFG() {
		return appcfgmap.get("appProp");
	}

	/**
	 * 获取关于oracle数据库的配置信息容器
	 * 
	 * @return
	 */
	public Properties getOraCFG() {
		Properties prop = appcfgmap.get("oraProp");
		String dateMethod = prop.getProperty("date");
		if ("Manual".equals(dateMethod)) {
			return prop;
		} else if ("Automatic".equals(dateMethod)) {
			String dates = DateHandle.dataHandle();
			prop.setProperty("start", dates.split("_")[0]);
			prop.setProperty("end", dates.split("_")[1]);
		}

		return prop;
	}

	/**
	 * 获取关于sftp配置信息的容器
	 * 
	 * @return
	 */
	public Properties getSftpCFG() {
		return appcfgmap.get("sftpProp");
	}

}
