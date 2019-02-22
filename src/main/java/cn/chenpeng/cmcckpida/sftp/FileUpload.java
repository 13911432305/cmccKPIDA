package cn.chenpeng.cmcckpida.sftp;

import java.io.File;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Vector;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.ChannelSftp.LsEntry;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

public class FileUpload {
	private SFTPUtil su;
	private Properties prop;
	private File path;
	private String rootpath;
	private Session session;
	private Channel channel;
	private ChannelSftp c;
	private ArrayList<File> al;

	public FileUpload(File path, Properties prop) {
		this.path = path;
		this.prop = prop;
		this.su = new SFTPUtil(prop.getProperty("user"), prop.getProperty("password"), prop.getProperty("host"),
				Integer.parseInt(prop.getProperty("port")));
	}

	public FileUpload(ArrayList<File> al, Properties prop) {
		this.al = al;
		this.prop = prop;
		this.su = new SFTPUtil(prop.getProperty("user"), prop.getProperty("password"), prop.getProperty("host"),
				Integer.parseInt(prop.getProperty("port")));
	}
	
	/**
	 * 根据文件夹名称进行上传
	 */
	public void doUploadByDir() {
		this.rootpath=prop.getProperty("rootpath");
		UploadMonitor monitor = null;
		try {
			su.login();
			session = su.getSession();
			channel = su.getChannel();
			c = (ChannelSftp) channel;
			File[] files = path.listFiles();
			Vector<LsEntry> ve = null;
			try {
				ve = c.ls(rootpath);
				c.cd(rootpath);
			} catch (SftpException e) {
				if (e.toString().contains("No such file")) {
					c.mkdir(rootpath);
					c.cd(rootpath);
				}
			}
			try {
				ve = c.ls(path.getName());
				c.cd(path.getName());
			} catch (SftpException e) {
				if (e.toString().contains("No such file")) {
					c.mkdir(path.getName());
					c.cd(path.getName());
				}
			}
			String dstName = c.pwd();
			for(File file:files) {
				monitor = new UploadMonitor(file.length());
				c.put(file.getAbsolutePath(), dstName+"/"+file.getName(), monitor, ChannelSftp.OVERWRITE);
			}
		} catch (SftpException e) {
			e.printStackTrace();
		}finally {
			su.logout();
		}
		
	}
	
	public void doUploadByFile() {
		this.rootpath=prop.getProperty("rootpath");
		this.path=al.get(1).getParentFile();
		UploadMonitor monitor = null;
		try {
			su.login();
			session = su.getSession();
			channel = su.getChannel();
			c = (ChannelSftp) channel;
			Vector<LsEntry> ve = null;
			try {
				ve = c.ls(rootpath);
				c.cd(rootpath);
			} catch (SftpException e) {
				if (e.toString().contains("No such file")) {
					c.mkdir(rootpath);
					c.cd(rootpath);
				}
			}
			try {
				ve = c.ls(path.getName());
				c.cd(path.getName());
			} catch (SftpException e) {
				if (e.toString().contains("No such file")) {
					c.mkdir(path.getName());
					c.cd(path.getName());
				}
			}
			String dstName = c.pwd();
			for(int i=0;i<al.size();i++) {
				File file = al.get(i);
				monitor = new UploadMonitor(file.length());
				c.put(file.getAbsolutePath(), dstName+"/"+file.getName(), monitor, ChannelSftp.OVERWRITE);
			}
		} catch (SftpException e) {
			e.printStackTrace();
		}finally {
			su.logout();
		}
	}
	

}
