package com.snr.webapp.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.snr.webapp.dao.MemberDao;
import com.snr.webapp.dao.NoticeDao;
import com.snr.webapp.dao.NoticeFileDao;
import com.snr.webapp.entity.Notice;
import com.snr.webapp.entity.NoticeView;

//boardcontroller�� ���� ������ ����
//���񽺸� ����� ���� : Ʈ����� ���� ( ��ø�ǰų� ��ġ�� ��쿡 �ʿ� ) 
public class BoardService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private NoticeFileDao noticefileDao;
	
	@Autowired
	private MemberDao memberDao;
	
	public List<NoticeView> getNoticeList(){
		 
		 return noticeDao.getList(1, "title", "");

	 }
	 
	 public List<NoticeView> getNoticeList(String field, String query) {
		 
		 return null;
		 
	 }
	 
	 //transaction�� �ʿ��� �۾� insertAndPointUp
	 @Transactional
	 public int insertAndPointUp(Notice notice) {
		 
		 noticeDao.insert(notice);
		 memberDao.pointUp(notice.getWriterId());
		 
		 return 0;
	 }

	public Object getNoticePrev(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getNotice(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getNoticeNext(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getNoticeNextId() {
		// TODO Auto-generated method stub
		return null;
	}
	 
}

