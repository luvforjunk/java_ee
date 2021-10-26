package user.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDAO {
	private static UserDAO instance = null;
	private SqlSessionFactory sqlSessionFactory;

	public static UserDAO getInstance() { // 쭉 생성된 채로 있어야 하니까 static
		if (instance == null) {
			synchronized (UserDAO.class) {
				instance = new UserDAO();// 생성
			}
		}
		return instance;
	}
	
	public UserDAO() {
		// mybatis-config.xml에 설정한 환경설정을 읽는다.
		// InputStream 혹은 Reader를 통해 읽어온다
		
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			// InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			// sqlSessionFactory도 인터페이스ㅇ므로 SqlSessionFactoryBuilder을 이용한다
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	public void write(UserDTO userDTO) {
		//Mybatis를 쓰는 이유는 자바와 sql을 분리하기 위함으로 sql문장을 써주면 안된다
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("userSQL.write", userDTO); // 데이터가 다 들어가 있는 DTO를 가지고 Mapper.xml로
		sqlSession.commit(); //insert, update, delete
		sqlSession.close();
	}

	public List<UserDTO> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List list = sqlSession.selectList("userSQL.getUserList");
		sqlSession.close();
		return list;
	}

	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		// selectOne : 딱 한줄만 가져오겠다. 
		// getUser라는 Mapper파일로 넘어와 id에 getUser라고 명시된 것을 찾아오고
		// parameter로 Mapper에 넘겨준 뒤 다시 DAO의 selectOne으로 넘어와 DTO에 넘긴다
		sqlSession.close();
		// Generic 타입이 자동적으로 바뀐다. 
			
		return userDTO;
	}

	public void update(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("userSQL.update", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<UserDTO> search(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		sqlSession.close();
		return list;
	}
}
