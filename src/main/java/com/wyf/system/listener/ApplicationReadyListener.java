package com.wyf.system.listener;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

/**
 * 应用启动完成事件监听
 */
@Component
public class ApplicationReadyListener implements ApplicationListener<ApplicationReadyEvent> {

	private static final Logger log = LoggerFactory.getLogger(ApplicationReadyListener.class);
	
	
	
	@Override
	public void onApplicationEvent(ApplicationReadyEvent arg0) {
		log.info("aplication启动完成");
		Set<String> set = new HashSet<>();
		try {
			File file = ResourceUtils.getFile("classpath:config/china_ip_list.txt");
			try (RandomAccessFile accessFile = new RandomAccessFile(file, "r")) {
				while (true) {
					String str = accessFile.readLine();
					str = str.substring(0, str.indexOf(".", str.indexOf(".") + 1));
					set.add(str);
					if (accessFile.getFilePointer() == accessFile.length()) {
						break;
					}
				}
			} catch (IOException e) {
				
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

}
