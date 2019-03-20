package com.irs.util;

import java.io.Serializable;

public class ResponseResultLayui<T> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int count;
	private int code;
	private String msg;
	private T data;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + code;
		result = prime * result + count;
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((msg == null) ? 0 : msg.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ResponseResultLayui other = (ResponseResultLayui) obj;
		if (code != other.code)
			return false;
		if (count != other.count)
			return false;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (msg == null) {
			if (other.msg != null)
				return false;
		} else if (!msg.equals(other.msg))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ResponseResultLayui [count=" + count + ", code=" + code + ", msg=" + msg + ", data=" + data + "]";
	}
	public ResponseResultLayui(int count, int code, String msg, T data) {
		super();
		this.count = count;
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	public ResponseResultLayui() {
		super();
	}

	
}
