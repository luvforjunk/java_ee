package board.bean;

import lombok.Data;
/*
import lombok.Getter;
import lombok.Setter;
*/

//@Getter
//@Setter
@Data
public class BoardDTO {
	private int seq;
	private String id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private int pseq;
	private int reply;
	private int hit;
	private String logtime;
}

/* 
 * 필요한 데이터는 subject와 content밖에 없지만 
 * 꺼내올 때는 리스트 전부를 꺼내온다
*/