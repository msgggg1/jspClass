package org.doit.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter 
@NoArgsConstructor 
@AllArgsConstructor
@ToString
@Builder
public class DeptEmpVO {
		private int empno;
		private String ename, job, dname;
		private int mgr;
		private Date hiredate;
		private double sal, comm;
		private int deptno;
		
}
