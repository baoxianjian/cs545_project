package edu.mum.project.domain;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.usertype.UserType;

public class Phone implements UserType,java.io.Serializable {
	private static final long serialVersionUID=323;
	
	public Phone(Integer area, Integer prefix, Integer number) {
		super();
		this.area = area;
		this.prefix = prefix;
		this.number = number;
	}
	
	private Integer area;
	private Integer prefix;
	private Integer number;
	
	private static final int[] SQL_TYPES = { Types.VARCHAR};
	
	public Phone() {};
	
	public Integer getArea() {
		return area;
	}
	public void setArea(Integer area) {
		this.area = area;
	}
	public Integer getPrefix() {
		return prefix;
	}
	public void setPrefix(Integer prefix) {
		this.prefix = prefix;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
	public String toOneString() {
		System.out.println(this.area.toString()+this.prefix.toString()+this.number.toString());
		return this.area.toString()+this.prefix.toString()+this.number.toString();
	}
	
	public Phone parseString(String str) {
		if(str!=null) {
			Integer area=Integer.parseInt(str.substring(0,3));
			Integer prefix=Integer.parseInt(str.substring(3,6));
			Integer number=Integer.parseInt(str.substring(6,10));
			return new Phone(area,prefix,number);
		}
		return null;
	}

	@Override
	public Object assemble(Serializable arg0, Object arg1) throws HibernateException {
		// TODO Auto-generated method stub
		return (Serializable) deepCopy(arg0);
	}

	@Override
	public Object deepCopy(Object arg0) throws HibernateException {
		// TODO Auto-generated method stub
		if(arg0==null)
			return null;
		Phone phone=(Phone) arg0;
		return new Phone(phone.getArea(),phone.getPrefix(),phone.getNumber());
	}

	@Override
	public Serializable disassemble(Object arg0) throws HibernateException {
		// TODO Auto-generated method stub
		return (Serializable) deepCopy(arg0);
	}

	@Override
	public boolean equals(Object arg0, Object arg1) throws HibernateException {
		// TODO Auto-generated method stub
		if(arg0==arg1)
			return true;
		if(arg0==null || arg1==null)
			return false;
		return arg0.equals(arg1);
	}

	@Override
	public int hashCode(Object arg0) throws HibernateException {
		// TODO Auto-generated method stub
		return arg0.hashCode();
	}

	@Override
	public boolean isMutable() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object nullSafeGet(ResultSet arg0, String[] arg1, SessionImplementor arg2, Object arg3)
			throws HibernateException, SQLException {
		// TODO Auto-generated method stub
		return parseString(arg0.getString(arg1[0]));
	}

	@Override
	public void nullSafeSet(PreparedStatement arg0, Object arg1, int arg2, SessionImplementor arg3)
			throws HibernateException, SQLException {
		// TODO Auto-generated method stub
		if(arg1==null) {
			arg0.setNull(arg2, Types.VARCHAR);
		} else {
			Phone phone=(Phone) arg1;
			arg0.setString(arg2, phone.toOneString());
		}
	}

	@Override
	public Object replace(Object arg0, Object arg1, Object arg2) throws HibernateException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Class returnedClass() {
		// TODO Auto-generated method stub
		return Phone.class;
	}

	@Override
	public int[] sqlTypes() {
		// TODO Auto-generated method stub
		return SQL_TYPES;
	}
}
