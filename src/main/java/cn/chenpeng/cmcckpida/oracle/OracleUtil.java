package cn.chenpeng.cmcckpida.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Oracle数据库的一个工具类
 * 
 * @author ChenPeng
 *
 */
public class OracleUtil {
	private String USERNAME;
	private String PASSWORD;
	private String DRVIER;
	private String URL;
	private Connection connection = null;

	/**
	 * 构造时即传入数据库连接参数
	 * 
	 * @param username
	 * @param password
	 * @param driver
	 * @param url
	 */
	public OracleUtil(String username, String password, String driver, String url) {
		this.USERNAME = username;
		this.PASSWORD = password;
		this.DRVIER = driver;
		this.URL = url;
	}

	/**
	 * 给调用者返回一个Connection连接
	 */
	public Connection getConnection() {
		try {
			Class.forName(DRVIER);
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("class not find !", e);
		} catch (SQLException e) {
			throw new RuntimeException("获取连接错误，请检查数据库连接配置！", e);
		}
		return connection;
	}
	/**
	 * 释放连接！
	 * @param connection
	 */
	public void release(Connection connection) {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection = null;
		}
	}
}
