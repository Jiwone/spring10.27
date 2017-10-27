package com.snr.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.snr.webapp.dao.NoticeFileDao;
import com.snr.webapp.entity.NoticeFile;

public class MyBatisNoticeFileDao implements NoticeFileDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<NoticeFile> getListByNoticeId(String noticeId) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		List<NoticeFile> list = noticeFileDao.getListByNoticeId(noticeId);
		return list;
	}

	@Override
	public int insert(NoticeFile noticeFile) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		return noticeFileDao.insert(noticeFile);
	}

	@Override
	public int update(NoticeFile noticeFile) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		return noticeFileDao.update(noticeFile);
	}

	@Override
	public int delete(String id) {
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		return noticeFileDao.delete(id);
	}

}
