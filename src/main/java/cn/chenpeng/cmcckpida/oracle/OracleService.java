package cn.chenpeng.cmcckpida.oracle;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
import java.util.TreeMap;

import cn.chenpeng.cmcckpida.configs.Configrations;
/**
 * 完成所有取数任务
 * @author ChenPeng
 *
 */
public class OracleService {
	private Configrations cfg;
	private Map<String, Properties> map;

	public OracleService(Configrations cfg) {
		this.cfg = cfg;
	}
	/**
	 * 首先使用一个map装下所有omc连接配置数据。
	 * 在每种连接配置中包含4中类型的脚本
	 * @return
	 */
	public Map<String, Properties> createTempProp() {
		map = new TreeMap<String, Properties>();
		Properties appProp = cfg.getAppCFG();
		Properties oraProp = cfg.getOraCFG();

		int omcNum = Integer.parseInt(appProp.getProperty("omcnum"));
		/**
		 * 有几个omc就循环几次，生成几个配置文件。
		 */
		for (int i = 1; i <= omcNum; i++) {
			Properties tempProp = new Properties();
			tempProp.setProperty("appPath", appProp.getProperty("appPath"));
			tempProp.setProperty("sqlscriptpath", appProp.getProperty("sqlscriptpath"));
			tempProp.setProperty("datapath", appProp.getProperty("datapath"));
			tempProp.setProperty("omcnum", appProp.getProperty("omcnum"));
			tempProp.setProperty("omcname", appProp.getProperty("omc" + i));
			tempProp.setProperty("dbdriver", appProp.getProperty("dbdriver"));
			tempProp.setProperty("projectname", appProp.getProperty("projectname"));
			int dataTypeNum = Integer.parseInt(appProp.getProperty("datatypenum"));
			tempProp.setProperty("datatypenum", appProp.getProperty("datatypenum"));
			
			/**
			 * 加入4中数据类型
			 */
			for (int j = 1; j <= dataTypeNum; j++) {
				tempProp.setProperty("datatype" + j, appProp.getProperty("datatype" + j) + "_data");
				tempProp.setProperty("sqlscript" + j, oraProp.getProperty("sqlscript" + j) + "_sql");
				tempProp.setProperty(appProp.getProperty("datatype" + j) + "_data",
						appProp.getProperty(appProp.getProperty("datatype" + j)));
				tempProp.setProperty(oraProp.getProperty("sqlscript" + j) + "_sql",
						oraProp.getProperty(oraProp.getProperty("sqlscript" + j)));
			}

			tempProp.setProperty("url", oraProp.getProperty("url" + i));
			tempProp.setProperty("user", oraProp.getProperty("user" + i));
			tempProp.setProperty("password", oraProp.getProperty("password" + i));
			tempProp.setProperty("start", oraProp.getProperty("start"));
			tempProp.setProperty("end", oraProp.getProperty("end"));
			map.put("omc" + i, tempProp);

			/**
			 * 测试
			 */
			/*
			 * Set<Entry<Object, Object>> set = tempProp.entrySet(); Iterator<Entry<Object,
			 * Object>> it = set.iterator(); while(it.hasNext()) { Entry<Object, Object>
			 * entry = it.next(); System.out.println(entry.getKey()+"="+entry.getValue()); }
			 */
		}

		return map;
	}
	/**
	 * 循环遍历记录配置文件的MAP
	 * @return
	 */
	public ArrayList<File> doDataAcquisition() {
		ArrayList<File> al = new ArrayList<File>();
		if (map == null) {
			map = createTempProp();
		}
		Set<Entry<String, Properties>> set = map.entrySet();
		Iterator<Entry<String, Properties>> it = set.iterator();
		
		while (it.hasNext()) {
			Properties prop = it.next().getValue();
			System.out.println(prop.getProperty("url"));
			System.out.println("--------------------------------");
			DataAcquisition da = new DataAcquisition(prop);
			al.addAll(da.getAllData());
		}
		return al;
	}

}
