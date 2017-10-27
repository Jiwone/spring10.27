package com.snr.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.snr.webapp.dao.NoticeDao;
import com.snr.webapp.entity.Notice;
import com.snr.webapp.entity.NoticeView;

public class MyBatisNoticeDao implements NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeView> getList(int page, String field, String query) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		List<NoticeView> list = noticeDao.getList(page, field, query);
		return list;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeView get(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView noticeView = noticeDao.get(id);
		return noticeView;
	}

	@Override
	public int update(String id, String title, String content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(String title, String content, String writerId) {
		return insert(new Notice(title, content, writerId));
	}

	@Override
	public int insert(Notice notice) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.insert(notice);
	}

	@Override
	public NoticeView getPrev(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView prev = noticeDao.getPrev(id);
		return prev;
	}

	@Override
	public NoticeView getNext(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView next = noticeDao.getNext(id);
		return next;
	}

	@Override
	public String getNextId() {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.getNextId();
	}

}
