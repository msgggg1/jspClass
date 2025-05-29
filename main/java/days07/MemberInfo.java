package days07;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
// Java Beans
public class MemberInfo implements Serializable {
	
	private static final long serialVersionUID = 2710540731633149235L;
	
	private String id ;
  	private String name ;
  	private String passwd ;
  	private String email;
  	
  	private Date registerDate;
}
