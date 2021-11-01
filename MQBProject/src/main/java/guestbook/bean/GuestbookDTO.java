package guestbook.bean;

import lombok.Data;

@Data

public class GuestbookDTO {
	private int seq;
	private String id;
	private String email1;
	private String email2;
	private String subject;
	private String content;
}