package ${group}.generator.entity;

/**
 * 数据库字段封装类
 * Created by Ay on 2017/5/3.
 */
public class ColumnClass {

    /** 数据库字段名称 **/
    private String columnName;
    /** 数据库字段类型 **/
    private String columnType;
    /** 数据库字段首字母小写且去掉下划线字符串 **/
    private String changeColumnName;
    /** 数据库字段注释 **/
    private String columnComment;
    
    /** 是否是主键 **/
    private boolean pk;
    
    public boolean isPk() {
		return pk;
	}

	public void setPk(boolean pk) {
		this.pk = pk;
	}

	public String getColumnComment() {
        return columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getChangeColumnName() {
        return changeColumnName;
    }

    public void setChangeColumnName(String changeColumnName) {
        this.changeColumnName = changeColumnName;
    }
    
}