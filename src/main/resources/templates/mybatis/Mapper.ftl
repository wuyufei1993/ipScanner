<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${package_name}.dao.${table_name}DAO">
	
	<resultMap id="BaseResultMap" type="${package_name}.dto.${table_name}DTO">
		<#if model_column?exists>
			<#list model_column as model>
				<#if model.pk=true>
					<id column="${model.columnName}" property="${model.changeColumnName?uncap_first}" jdbcType="${model.columnType}" />
				<#else>	
					<result column="${model.columnName}" property="${model.changeColumnName?uncap_first}" jdbcType="${model.columnType}" />
				</#if>
			</#list>
		</#if>
	</resultMap>
	
	<sql id="Base_Column_List">
		<#if model_column?exists>
			<#list model_column as model>
				<#if model_has_next>
					${model.columnName},
				<#else>
					${model.columnName}
				</#if>
			</#list>
		</#if>
	</sql>
	
	<select id="findById" resultMap="BaseResultMap">
		select 
		<include refid="Base_Column_List" />
		from ${table_name_small}
		where <#list model_column as model> <#if model.pk=true> ${model.columnName} = ${'#{'}${model.changeColumnName?uncap_first}} 
					<#break> 
					</#if>
			  </#list>
	</select>
	
	<select id="findAll" resultMap="BaseResultMap">
		select 
		<include refid="Base_Column_List" />
		from ${table_name_small}
		where 1 = 1
		<#list model_column as model>
		<if test="${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first} != null">
			and ${model.columnName} = ${'#{'}${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first},jdbcType=${model.columnType}}
		</if>
		</#list>
	</select>
	
	<select id="findByPage" resultMap="BaseResultMap">
		select 
		<include refid="Base_Column_List" />
		from ${table_name_small}
		where 1 = 1
		<#list model_column as model>
		<if test="${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first} != null">
			and ${model.columnName} = ${'#{'}${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first},jdbcType=${model.columnType}}
		</if>
		</#list>
	</select>
	
	<insert id="create">
		insert into ${table_name_small}
		<trim prefix="(" suffix=")" suffixOverrides=",">
			<#if model_column?exists>
				<#list model_column as model>
						<if test="${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first} != null">
							${model.columnName},
						</if>
				</#list>
			</#if>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
			<#if model_column?exists>
				<#list model_column as model>
						<if test="${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first} != null">
							${'#{'}${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first},jdbcType=${model.columnType}},
						</if>
				</#list>
			</#if>
		</trim>
	</insert>
	
	<update id="update">
		update ${table_name_small}
		<set>
			<#if model_column?exists>
				<#list model_column as model>
					<#if model.pk!=true>
						<if test="${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first} != null">
							${model.columnName} = ${'#{'}${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first},jdbcType=${model.columnType}},
						</if>
					</#if>
				</#list>
			</#if>
		</set>
		where <#list model_column as model> <#if model.pk=true> ${model.columnName} = ${'#{'}${table_name?uncap_first}DTO.${model.changeColumnName?uncap_first}} 
					<#break> 
					</#if>
			  </#list>
	</update>
	
	<delete id="delete">
		delete from ${table_name_small} 
		where <#list model_column as model> <#if model.pk=true> ${model.columnName} = ${'#{'}${model.changeColumnName?uncap_first}} 
					<#break> 
					</#if>
			  </#list>
	</delete>
</mapper>