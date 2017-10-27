package com.snr.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.snr.webapp.entity.Notice;
import com.snr.webapp.entity.NoticeView;

public interface NoticeDao {
	List<NoticeView> getList(@Param("page") int page,@Param("field") String field,@Param("query") String query);
	int getCount();
	NoticeView get(String id);
	int update(String id, String title, String content);
	int insert(String title, String content, String writerId);
	int insert(Notice notice);
	NoticeView getPrev(String id);
	NoticeView getNext(String id);
	String getNextId();
}
