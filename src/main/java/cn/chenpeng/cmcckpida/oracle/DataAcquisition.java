package cn.chenpeng.cmcckpida.oracle;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

/**
 * 鏈被涓轰竴涓粠Oracle鏁版嵁搴撲腑鎸夌収鎸囧畾sql鑴氭湰鍙栨暟鎹殑绫�
 * 
 * @author ChenPeng
 *
 */
public class DataAcquisition {

	private OracleUtil oUtil;
	private Connection conn;
	private Properties prop;
	private String APPPATH;
	private String SQLSCRIPTPATH;
	private String DATAPATH;
	private String PROJECTNAME;
	private String OMCNAME;
	private String DATE;

	private String URL;
	private String USERNAME;
	private String PASSWORD;
	private String DRIVER;

	private String START;
	private String END;

	private int DATATYPENUM;

	private ArrayList<String> sqlList;
	private ArrayList<String> fileList;

	public DataAcquisition(Properties prop) {
		this.prop = prop;
		this.URL = prop.getProperty("url");
		this.DRIVER = prop.getProperty("dbdriver");
		this.USERNAME = prop.getProperty("user");
		this.PASSWORD = prop.getProperty("password");
		this.START = prop.getProperty("start");
		this.END = prop.getProperty("end");
		this.APPPATH = prop.getProperty("appPath");
		this.SQLSCRIPTPATH = prop.getProperty("sqlscriptpath");
		this.DATAPATH = prop.getProperty("datapath");
		this.DATATYPENUM = Integer.parseInt(prop.getProperty("datatypenum"));
		this.OMCNAME = prop.getProperty("omcname");
		this.PROJECTNAME = prop.getProperty("projectname");
		this.DATE = this.START + "_" + this.END;
		sqlList = new ArrayList<String>();
		fileList = new ArrayList<String>();

		for (int i = 1; i <= DATATYPENUM; i++) {
			sqlList.add(prop.getProperty("sqlscript" + i));
			fileList.add(prop.getProperty("sqlscript" + i));
		}
	}

	/**
	 * 
	 * 
	 * @return
	 * @throws IOException
	 */
	public ArrayList<File> getAllData() {
		ArrayList<File> allFile = new ArrayList<File>();
		System.out.println("连接数据库:" + this.OMCNAME);
		this.oUtil = new OracleUtil(USERNAME, PASSWORD, DRIVER, URL);
		this.conn = oUtil.getConnection();

		for (int i = 1; i <= DATATYPENUM; i++) {
			String sqlFileName = prop.getProperty(prop.getProperty("sqlscript" + i));
			String dataFileName = prop.getProperty(prop.getProperty("datatype" + i));

			/**
			 * 此处为修改时间样式的地方
			 */
			System.out.println("	" + i);
			if (dataFileName.startsWith("RSLTE")) {
				File file = this.getData(sqlFileName, dataFileName, START + "000000", END + "235959");
				allFile.add(file);
			} else {
				File file = this.getData(sqlFileName, dataFileName, START, END);
				allFile.add(file);
			}
		}
		oUtil.release(conn);
		System.out.println("连接断开");
		return allFile;
	}

	public File getData(String sqlFileName, String dataFileName, String startTime, String endTime) {
		System.out.println("	数据文件类型：	" + dataFileName);
		dataFileName = dataFileName.replaceAll("Project", PROJECTNAME);
		dataFileName = dataFileName.replaceAll("Netact", OMCNAME);
		dataFileName = dataFileName.replaceAll("Date", DATE);
		PreparedStatement ps = null;
		ResultSet rs = null;
		File sqlFile = null;
		File dataFile = null;
		BufferedReader br = null;
		BufferedWriter bw = null;

		StringBuilder sb = new StringBuilder();
		String line = null;

		try {
			sqlFile = new File(APPPATH + System.getProperty("file.separator") + SQLSCRIPTPATH
					+ System.getProperty("file.separator") + sqlFileName);
			br = new BufferedReader(new InputStreamReader(new FileInputStream(sqlFile), "GBK"));
			while ((line = br.readLine()) != null) {
				sb.append(line).append(System.getProperty("line.separator"));
			}
			String sql = sb.toString().replaceAll("&start", startTime).replaceAll("&end", endTime);
			File datadatedir = new File(APPPATH + System.getProperty("file.separator") + DATAPATH
					+ System.getProperty("file.separator") + START + "_" + END);
			/**
			 * 判断文件夹是否存在，不存在则新建！
			 */
			if (!datadatedir.exists()) {
				datadatedir.mkdirs();
			}

			dataFile = new File(datadatedir.getAbsolutePath() + System.getProperty("file.separator") + dataFileName);
			bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(dataFile), "GBK"));
			StringBuilder str = null;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int column = rs.getMetaData().getColumnCount();

			str = new StringBuilder(rs.getMetaData().getColumnName(1));
			for (int j = 2; j <= column; j++) {
				str.append(",").append(rs.getMetaData().getColumnName(j).toString());
			}
			bw.write(str.toString());
			bw.write(System.getProperty("line.separator"));

			while (rs.next()) {
				str = new StringBuilder(rs.getObject(1).toString());
				for (int i = 2; i <= column; i++) {
					if (rs.getObject(i) == null) {
						str.append(",").append("");
					} else {
						str.append(",").append(rs.getObject(i).toString());
					}
				}
				bw.write(str.toString());
				bw.write(System.getProperty("line.separator"));
			}

			System.out.println("	数据文件：	" + dataFileName);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				br = null;
				bw = null;
			}

		}

		return dataFile;
	}
}
