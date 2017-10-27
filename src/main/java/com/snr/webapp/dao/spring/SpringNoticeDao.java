package com.snr.webapp.dao.spring;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.snr.webapp.dao.NoticeDao;
import com.snr.webapp.entity.Notice;
import com.snr.webapp.entity.NoticeView;

public class SpringNoticeDao implements NoticeDao {

	@Autowired
	private JdbcTemplate template;
	
	/*Transaction ó�� ��� 1
	 * ���Ӱ� ù��° ���� transactionManager�� ���� ����ϴ� ���
	@Autowired
	private PlatformTransactionManager transactionManager;*/
	//autowired�ٿ��ٴ� �� �̰� ioc �����̳ʿ��� �������ڴ�!!!!!
	
	
/*	Transaction ó�� ��� 2*/
/*	@Autowired
	private TransactionTemplate transactionTemplate;*/
	
	
/*	������ �������� �ƴ϶� �Ʒ����� ���ִ°� ����. ��ġ�� �������� �ص� �Ǵϱ� ������
 * autowired�� ������ service-context.xml���� <property name="template" ref="template"></property>�̺κ��� ����.
 * ������ �ʾҴٸ� autowired�� ������� �ʰ� �׳� private JdbcTemplate template;�� ���. 
 * @Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	*/

	@Override
	public List<NoticeView> getList(int page, String field, String query) {
		
		String sql="select * from NoticeView where ? like ? order by regDate DESC limit ?,10";
		//JdbcTemplate template= new JdbcTemplate();
		List<NoticeView> list = template.query(sql,
				new Object[] {"'%"+field+"%'","'%"+query+"%'",(page-1)*10},
				BeanPropertyRowMapper.newInstance(NoticeView.class));
		
		return list;
	}

	@Override
	public int getCount() {
		
		String sql ="select count(id) `count` from Notice";
		int count = template.queryForObject(
				sql, 
				BeanPropertyRowMapper.newInstance(Integer.class));
		
		return count;
	}

	@Override
	public NoticeView get(String id) {
		
		String sql="select * from Notice where id=?";
		NoticeView notice = template.queryForObject(sql, 
				new Object[] {id},
				BeanPropertyRowMapper.newInstance(NoticeView.class));
		
/*		NoticeView notice = template.queryForObject(sql, 
				new Object[] {id},
				new RowMapper<NoticeView>() {
			
			@Override
			public NoticeView mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				NoticeView notice = new NoticeView();
				notice.setId(rs.getString("id"));
				notice.setTitle(rs.getString("title"));
				notice.setWriterId(rs.getString("writerId"));
				notice.setContent(rs.getString("content"));
				notice.setHit(0);
				
				return null;
			}
			
			
		});*/
		
		/*
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://211.238.142.247/newlecture?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=utf8");
		dataSource.setUsername("sist");
		dataSource.setPassword("cclass");*/
		
		/*JdbcTemplate template= new JdbcTemplate();
		template.setDataSource(dataSource); //db������ ����
	
		NoticeView notice = template.queryForObject(sql, 
			BeanPropertyRowMapper.newInstance(NoticeView.class));
		*/	
		return notice;
	
	}

	@Override
	public int update(String id, String title, String content) {
		
		String sql ="UPDATE Notice SET title=?,content=? WHERE id=?";
		int result=template.update(sql
				,title
				,content
				,id);
		
		//�Ʒ� ó�� ���۾����� �Ҽ��� ���� = ���� �츮�� ���� ���
	/*	int result = template.update(sql,new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement st) throws SQLException {
				st.setString(1,title);
				st.setString(2,content);
				st.setString(3,id);
				
			}
		});*/
		return result;
	}

	@Override
	public int insert(String title, String content, String writerId) {
		
		return insert(new Notice(title,content,writerId));
	
	}
	
	/*Transaction ó�� ��� 4(@Transactional)
	AOP��  ��� �ϴ� ���*/
	@Override
	@Transactional
	public int insert(Notice notice) {
		//�긦�����ϰ� ������ ���� �ϸ� ��. 
		String sql ="insert into Notice(id, title, content, writerId) values(?, ?, ?, ?)";
		
		String sql1="UPDATE Member SET point=point+1 where id=?";
		
		int result=0;
		
	
			result += template.update(sql
						,getNextId()
						,notice.getTitle()
						,notice.getContent()
						,notice.getWriterId() );
			
			result += template.update(sql1
						,notice.getWriterId());

			return result;

	}

/*	Transaction ó�� ��� 3
	AOP��  ��� �ϴ� ���
	@Override
	public int insert(Notice notice) {
		//�긦�����ϰ� ������ ���� �ϸ� ��. 
		String sql ="insert into Notice(id, title, content, writerId) values(?, ?, ?, ?)";
		
		String sql1="UPDATE Member SET point=point+1 where id=?";
		
		int result=0;
		
	
			result += template.update(sql
						,getNextId()
						,notice.getTitle()
						,notice.getContent()
						,notice.getWriterId() );
			
			result += template.update(sql1
						,notice.getWriterId());

			return result;

	}
	*/
	
	
/*	//  Transaction ó�� ��� 2
 * TransactionTemplate�� ����ϴ� ���
	@Override
	public int insert(Notice notice) {
		//�긦�����ϰ� ������ ���� �ϸ� ��. 
		String sql ="insert into Notice(id, title, content, writerId) values(?, ?, ?, ?)";
		
		String sql1="UPDATE Member SET point=point+1 where id=?";
		
		int result=0;
		
		result=(int) transactionTemplate.execute(new TransactionCallbackWithoutResult() {
		
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus arg0) {
			 template.update(sql
						,getNextId()
						,notice.getTitle()
						,notice.getContent()
						,notice.getWriterId() );
			
			template.update(sql1
						,notice.getWriterId());

			}
		});
	
			return result;

	}
	*/
	
	
/*  Transaction ó�� ��� 1
 * ���Ӱ� ù��° ���� transactionManager�� ���� ����ϴ� ���
	@Override
	public int insert(Notice notice) {
		//�긦�����ϰ� ������ ���� �ϸ� ��. 
		String sql ="insert into Notice(id, title, content, writerId) values(?, ?, ?, ?)";
		
		String sql1="UPDATE Member SET point=point+1 where id=?";
		
		DefaultTransactionDefinition def=new DefaultTransactionDefinition();
		TransactionStatus state = transactionManager.getTransaction(def);
		
		try {
			int result = template.update(sql
						,getNextId()
						,notice.getTitle()
						,notice.getContent()
						,notice.getWriterId() );
			
			result+=template.update(sql1
						,notice.getWriterId());
			
			transactionManager.commit(state);
			
			return result;

			}
		catch(Exception e)
		{
			transactionManager.rollback(state);
			throw e;
		
		}
	
		
	}*/

	@Override
	public NoticeView getPrev(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeView getNext(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	@Override
	public String getNextId() {
		String sql="select ifnull(MAX(CAST(id as unsigned)),0)+1 from Notice";
		
		String result = template.queryForObject(
					sql, 
					String.class);

		return result;
	}

}
