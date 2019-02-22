package cn.chenpeng.cmcckpida.sftp;

import com.jcraft.jsch.SftpProgressMonitor;
import java.text.NumberFormat;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * @author kevin.chen
 */
public class UploadMonitor implements SftpProgressMonitor, Runnable {
	/**
	 * 文件的总大小
	 */
	private long maxCount = 0;
	private long uploaded = 0;
	long startTime = 0L;
	private boolean isScheduled = false;
	ScheduledExecutorService executorService;

	public UploadMonitor(long maxCount) {
		this.maxCount = maxCount;
	}

	/**
	 * 当文件开始传输时，调用init方法
	 *
	 * @param op
	 * @param src
	 * @param dest
	 * @param max
	 */
	public void init(int op, String src, String dest, long max) {
		System.out.println("开始上传文件：" + src + "至远程：" + dest + "文件总大小:" + maxCount / 1024 + "KB");
		startTime = System.currentTimeMillis();
	}

	/**
	 * 当每次传输了一个数据块后，调用count方法，count方法的参数为这一次传输的数据块大小
	 *
	 * @param count
	 * @return
	 */
	public boolean count(long count) {
		if (!isScheduled) {
			createTread();
		}
		uploaded += count;
		//System.out.println("本次上传大小：" + count / 1024 + "KB,");
		if (count > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 当传输结束时，调用end方法
	 */
	public void end() {
	}

	/**
	 * 创建一个线程每隔一定时间，输出一下上传进度
	 */
	public void createTread() {
		executorService = Executors.newSingleThreadScheduledExecutor();
		// 1秒钟后开始执行，每2杪钟执行一次
		executorService.scheduleWithFixedDelay(this, 1, 2, TimeUnit.SECONDS);
		isScheduled = true;
	}

	public void run() {
		NumberFormat format = NumberFormat.getPercentInstance();
		format.setMaximumFractionDigits(2);
		format.setMinimumFractionDigits(2);
		String value = format.format((uploaded / (double) maxCount));
		System.out.println("已传输：" + uploaded / 1024 + "KB,传输进度：" + value);
		if (uploaded == maxCount) {
			stop();
			long endTime = System.currentTimeMillis();
			System.out.println("传输完成！用时：" + (endTime - startTime) / 1000 + "s");
		}
	}

	public void stop() {
		boolean isShutdown = executorService.isShutdown();
		if (!isShutdown) {
			executorService.shutdown();
		}
	}
}
