package com.medical.domain;

public class SidoVO {
	// 멤버변수
<<<<<<< HEAD
		private int sicode;
		private String siname;
		
		
		public SidoVO() {}
		
		public SidoVO(int sicode, String siname) {
			super();
			this.sicode = sicode;
			this.siname = siname;
		}
		
		public int getsicode() {
			return sicode;
		}
		public void setsicode(int sicode) {
			this.sicode = sicode;
		}
		public String getsiname() {
			return siname;
		}
		public void setsiname(String siname) {
			this.siname = siname;
		}
		
		@Override
		public String toString() {
			return "SidoVO [sicode=" + sicode + ", siname=" + siname + "]";
		}
		
=======
	private int sicode;
	private String siname;
	
	
	public SidoVO() {}
	
	public SidoVO(int code, String palce) {
		super();
		this.sicode = code;
		this.siname = palce;
	}

	public int getSicode() {
		return sicode;
	}

	public void setSicode(int sicode) {
		this.sicode = sicode;
	}

	public String getSiname() {
		return siname;
	}

	public void setSiname(String siname) {
		this.siname = siname;
	}

	@Override
	public String toString() {
		return "SidoVO [sicode=" + sicode + ", siname=" + siname + "]";
	}

	

>>>>>>> branch 'master' of https://github.com/kimsutae/medical.git
}
