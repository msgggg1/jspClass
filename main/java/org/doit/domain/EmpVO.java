package org.doit.domain;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter 
@Setter 
@NoArgsConstructor 
@AllArgsConstructor
@ToString
@Builder
// 유지보수 쉽고, 간결
public class EmpVO {
	private int empno;
	private String ename, job;
	private int mgr;
	private Date hiredate;
	private double sal, comm;
	private int deptno;
//	public int getEmpno() {
//		return empno;
//	}
//	public void setEmpno(int empno) {
//		this.empno = empno;
//	}
//	public String getEname() {
//		return ename;
//	}
//	public void setEname(String ename) {
//		this.ename = ename;
//	}
//	public String getJob() {
//		return job;
//	}
//	public void setJob(String job) {
//		this.job = job;
//	}
//	public int getMgr() {
//		return mgr;
//	}
//	public void setMgr(int mgr) {
//		this.mgr = mgr;
//	}
//	public Date getHiredate() {
//		return hiredate;
//	}
//	public void setHiredate(Date hiredate) {
//		this.hiredate = hiredate;
//	}
//	public double getSal() {
//		return sal;
//	}
//	public void setSal(double sal) {
//		this.sal = sal;
//	}
//	public double getComm() {
//		return comm;
//	}
//	public void setComm(double comm) {
//		this.comm = comm;
//	}
//	public int getDeptno() {
//		return deptno;
//	}
//	public void setDeptno(int deptno) {
//		this.deptno = deptno;
//	}
//	
//	public EmpVO(int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno) {
//		super();
//		this.empno = empno;
//		this.ename = ename;
//		this.job = job;
//		this.mgr = mgr;
//		this.hiredate = hiredate;
//		this.sal = sal;
//		this.comm = comm;
//		this.deptno = deptno;
//	}
//	public EmpVO() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//	
//	
	
	
}
