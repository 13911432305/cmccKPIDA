package cn.chenpeng.cmcckpida.main;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import cn.chenpeng.cmcckpida.configs.Configrations;
import cn.chenpeng.cmcckpida.oracle.OracleService;
import cn.chenpeng.cmcckpida.sftp.FileUpload;

/**
 * 本程序将oracle取数+sftp上传功能融合
 * 
 * @author ChenPeng
 *
 */
public class CmcckpidaMain {

	public static void main(String[] args) throws IOException {
		/**
		 * 第一步：加载配置信息，生成一个配置对象。
		 */
		System.out.println("@加载配置信息");
		System.out.println("#########################################################################");
		Configrations cfg = new Configrations();
		System.out.println();

		/**
		 * 第二步进行oracle取数 先进行判断，判断原则： 如果jar执行命令带了参数，则按照参数值进行判断；
		 * 如果jar执行命令带了空参，则按照配置文件中的type值进行判断；
		 */
		int type = 0;
		if (args.length == 0) {
			type = Integer.parseInt(cfg.getAppCFG().getProperty("type"));
		} else if (args.length == 1) {
			type = Integer.parseInt(args[0]);
		}

		String typeName;
		switch (type) {
		case 0: {
			typeName = "执行所有";
			message(type, typeName);
			getData(cfg);
			upload(cfg);
			break;
		}

		case 1: {
			typeName = "仅oracle取数";
			message(type, typeName);
			getData(cfg);

			break;
		}
		case 2: {
			typeName = "仅sftp上传";
			message(type, typeName);
			upload(cfg);
			break;
		}
		default: {
			System.out.println("输入的执行方式类型参数超出范围，按照默认方式（0-执行所有）执行！");
			typeName = "执行所有";
			type = 0;
			getData(cfg);
			upload(cfg);
		}
		}
	}

	private static void message(int type, String typeName) {
		System.out.println();
		System.out.println("程序执行方式为：" + type + "-" + typeName);
		System.out.println();
	}

	private static void upload(Configrations cfg) {
		System.out.println("@SFTP上传");
		System.out.println("#########################################################################");
		File path = new File(cfg.getAppCFG().getProperty("appPath") + System.getProperty("file.separator") + "Data"
				+ System.getProperty("file.separator") + cfg.getOraCFG().getProperty("start") + "_"
				+ cfg.getOraCFG().getProperty("end"));
		FileUpload fu = new FileUpload(path, cfg.getSftpCFG());
		fu.doUploadByDir();
	}

	private static ArrayList<File> getData(Configrations cfg) {
		System.out.println("@Oracle取数");
		System.out.println("#########################################################################");
		OracleService os = new OracleService(cfg);
		os.createTempProp();
		ArrayList<File> al = os.doDataAcquisition();
		System.out.println();
		System.out.println();
		return al;

	}

}
