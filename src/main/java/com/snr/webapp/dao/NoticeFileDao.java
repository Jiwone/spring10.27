package com.snr.webapp.dao;

import java.util.List;

import com.snr.webapp.entity.NoticeFile;

public interface NoticeFileDao {
	List<NoticeFile> getListByNoticeId(String noticeId);
	int insert(NoticeFile noticeFile);
	int update(NoticeFile noticeFile);
	int delete(String id);
}
