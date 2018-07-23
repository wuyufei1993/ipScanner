package ${package_name}.model;

<#if importList?exists>
	<#list importList as import>
		${import};
	</#list>	
</#if>

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
* 描述：${table_annotation}模型
* @author ${author}
* @date ${date}
*/
@Entity
@Table(name = "${table_name_small}")
public class ${table_name} {

<#if model_column?exists>
   <#list model_column as model>
   		
	    /**
	    *${model.columnComment!}
	    */
	    <#if model.pk>
	    /*
		 * 此处根据具体的主键生成策略设置 如uuid：
		 * @GeneratedValue(generator = "uuid")
		 * @GenericGenerator(name = "uuid", strategy = "uuid")
		 *
		 * 如mysql自增长主键：
		 * @GeneratedValue(strategy=GenerationType.IDENTITY)
		 *
		 * 如oracle sequence生成主键：
		 * @GeneratedValue(strategy=GenerationType.SEQUENCE)
		 * @SequenceGenerator(name = "id_seq", sequenceName="序列名称",allocationSize=1)
		 * 
		 * 或者使用
		 * @GeneratedValue(strategy=GenerationType.AUTO) 自动选择一个最适合底层数据库的主键生成策略。
		 */
		@Id
	    </#if>
		@Column(name = "${model.columnName}")
	    <#if (model.columnType = 'VARCHAR' || model.columnType = 'TEXT' || model.columnType = 'CHAR')>
		private String ${model.changeColumnName?uncap_first};
	    </#if>
	    <#if model.columnType = 'TIMESTAMP' || model.columnType = 'DATE'|| model.columnType = 'TIME' || model.columnType = 'DATETIME' || model.columnType = 'YEAR'>
		private Date ${model.changeColumnName?uncap_first};
	    </#if>
	    <#if model.columnType = 'INTEGER' || model.columnType = 'TINYINT' || model.columnType = 'SMALLINT' || model.columnType = 'MEDIUMINT'>
		private Integer ${model.changeColumnName?uncap_first};
	    </#if>
	    <#if model.columnType = 'BIGINT' >
		private Long ${model.changeColumnName?uncap_first};
	    </#if>
	    <#if model.columnType = 'FLOAT' >
		private Float ${model.changeColumnName?uncap_first};
	    </#if>
	    <#if model.columnType = 'DOUBLE' >
		private Double ${model.changeColumnName?uncap_first};
	    </#if>
	    <#if model.columnType = 'BIT' || model.columnType = 'BOOLEAN'>
		private Boolean ${model.changeColumnName?uncap_first};
	    </#if>
   </#list>
</#if>

<#if model_column?exists>
<#list model_column as model>
	<#if (model.columnType = 'VARCHAR' || model.columnType = 'TEXT' || model.columnType = 'CHAR')>
	    public String get${model.changeColumnName}() {
	        return ${model.changeColumnName?uncap_first};
	    }
	    public void set${model.changeColumnName}(String ${model.changeColumnName?uncap_first}) {
	        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	    }
	</#if>
	<#if model.columnType = 'TIMESTAMP' || model.columnType = 'DATE'|| model.columnType = 'TIME' || model.columnType = 'DATETIME' || model.columnType = 'YEAR'>
	    public Date get${model.changeColumnName}() {
	        return ${model.changeColumnName?uncap_first};
	    }
	    public void set${model.changeColumnName}(Date ${model.changeColumnName?uncap_first}) {
	        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	    }
	</#if>
	<#if model.columnType = 'INTEGER' || model.columnType = 'TINYINT' || model.columnType = 'SMALLINT' || model.columnType = 'MEDIUMINT'>
		public Integer get${model.changeColumnName}() {
			return ${model.changeColumnName?uncap_first};
		}
		public void set${model.changeColumnName}(Integer ${model.changeColumnName?uncap_first}) {
	        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	    }
	</#if>
	<#if model.columnType = 'BIGINT' >
		public Long get${model.changeColumnName}() {
			return ${model.changeColumnName?uncap_first};
		}
		public void set${model.changeColumnName}(Long ${model.changeColumnName?uncap_first}) {
	        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	    }
	</#if>
	<#if model.columnType = 'FLOAT' >
		public Float get${model.changeColumnName}() {
			return ${model.changeColumnName?uncap_first};
		}
		public void set${model.changeColumnName}(Float ${model.changeColumnName?uncap_first}) {
	        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	    }
	</#if>
	<#if model.columnType = 'DOUBLE' >
		public Double get${model.changeColumnName}() {
			return ${model.changeColumnName?uncap_first};
		}
		public void set${model.changeColumnName}(Double ${model.changeColumnName?uncap_first}) {
	        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	    }
	</#if>
	
	<#if model.columnType = 'BIT' || model.columnType = 'BOOLEAN'>
		public Boolean is${model.changeColumnName}() {
			return ${model.changeColumnName?uncap_first};
		}
		public void set${model.changeColumnName}(Boolean ${model.changeColumnName?uncap_first}) {
	        this.${model.changeColumnName?uncap_first} = ${model.changeColumnName?uncap_first};
	    }
	</#if>
</#list>
</#if>

}