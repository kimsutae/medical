package com.medical.domain;

public class KindsVO {
	// 멤버변수
<<<<<<< HEAD
		private String mknumber;
		private String mkname;
		
		
		public KindsVO() {}
		
		public KindsVO(String mknumber, String mkname) {
			super();
			this.mknumber = mknumber;
			this.mkname = mkname;
		}
		
		public String getmknumber() {
			return mknumber;
		}
		public void setmknumber(String mknumber) {
			this.mknumber = mknumber;
		}
		public String getmkname() {
			return mkname;
		}
		public void setmkname(String mkname) {
			this.mkname = mkname;
		}
		
		@Override
		public String toString() {
			return "SidoVO [mknumber=" + mknumber + ", mkname=" + mkname + "]";
		}
		
=======
	private String mknumber;
	private String mkname;
	
	
	public KindsVO() {}
	
	public KindsVO(String mknumber, String mkname) {
		super();
		this.mknumber = mknumber;
		this.mkname = mkname;
	}

	public String getmknumber() {
		return mknumber;
	}

	public void setmknumber(String mknumber) {
		this.mknumber = mknumber;
	}

	public String getmkname() {
		return mkname;
	}

	public void setmkname(String mkname) {
		this.mkname = mkname;
	}

	@Override
	public String toString() {
		return "KindsVO [mknumber=" + mknumber + ", mkname=" + mkname + "]";
	}

	

>>>>>>> branch 'master' of https://github.com/kimsutae/medical.git
}
