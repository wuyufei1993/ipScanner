#server配置
server: 
  port: 8080
    
#spring配置
spring:
  application:
    name: ${artifact}
  mvc:
    servlet:
      load-on-startup: 1
  servlet:
    multipart:
      max-file-size: 50MB
      max-request-size: 50MB
     
  #数据源配置
  datasource:
    driver-class-name: com.mysql.jdbc.Driver
    url: ${url}
    username: ${user}
    password: ${password}
    druid:
        initial-size: 5
        min-idle: 10
        max-active: 50
        # 配置获取连接等待超时的时间
        max-wait: 60000
        # 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
        time-between-eviction-runs-millis: 60000
        #连接池中连接可空闲的时间
        min-evictable-idle-time-millis: 300000
        validation-query: SELECT 'x'
        test-while-idle: true
        test-on-borrow: false
        test-on-return: false
  devtools:
    restart:
      enabled: true
  

#mybatis配置
mybatis:
  mapper-locations: classpath:**/dao/*.xml
  
#pagehelper分页插件配置
pagehelper:
  helper-dialect: mysql
  reasonable: true
  support-methods-arguments: true
  params: count=countSql
  
logging:
  file:
    max-history: 10
  path: logs
  level:
    root: info
    ${group}: debug
    
upload:
  path: /usr/local/application/cgc/file/