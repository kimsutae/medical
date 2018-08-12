package com.medical.domain;

public class SidoVO {
	// 멤버변수
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
		
}
