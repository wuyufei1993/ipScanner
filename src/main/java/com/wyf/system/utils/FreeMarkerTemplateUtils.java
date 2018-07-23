package com.wyf.system.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.NullCacheStorage;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

/**
 * freemarker工具类
 *
 */
public class FreeMarkerTemplateUtils {
	
	private FreeMarkerTemplateUtils(){
		
	}
	
    private static final Map<String, Configuration> configMap = new HashMap<>();
    
    private static final String[] configTypes = new String[] {"mybatis", "hibernate"};

    static{
    	for (String path : configTypes) {
    		Configuration config = new Configuration(Configuration.VERSION_2_3_28);
    		//这里比较重要，用来指定加载模板所在的路径
    		config.setTemplateLoader(new ClassTemplateLoader(FreeMarkerTemplateUtils.class, "/templates/" + path));
    		config.setDefaultEncoding("UTF-8");
    		//TemplateExceptionHandler.DEBUG_HANDLER —— 打印堆栈信息和重新抛出异常。这是默认的异常控制器
    		//TemplateExceptionHandler.HTML_DEBUG_HANDLER —— 和DEBUG_HANDLER相同，但是可以格式化堆栈跟踪信息，HTML页面，建议使用它而不是DEBUG_HANDLER
    		//TemplateExceptionHandler.IGNORE_HANDLER —— 简单地压制所有异常。它对处理异常没有任何作用，也不会重新抛出异常
    		//TemplateExceptionHandler.RETHROW_HANDLER —— 简单重新抛出所有异常而不会做其他的事情。这个控制器对Web应用很好，因为它在生成的页面发生错误的情况下，给了对Web应用的更多的控制权
    		config.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
    		config.setCacheStorage(NullCacheStorage.INSTANCE);
    		configMap.put(path, config);
    	}
    }
    
    /**
     * @param templateName 模板名称
     * @param type 模板类型 对应 configPaths
     * @return
     * @throws IOException
     */
    public static Template getTemplate(String templateName, String type) throws IOException {
        try {
            return configMap.get(type).getTemplate(templateName);
        } catch (IOException e) {
            throw e;
        }
    }

    public static void clearCache() {
        for (Map.Entry<String, Configuration> entry : configMap.entrySet()) {
        	entry.getValue().clearTemplateCache();
        }
    }

}
