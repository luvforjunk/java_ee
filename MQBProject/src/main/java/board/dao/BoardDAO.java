package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;

	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardList", map);
		sqlSession.close();
		return list;
	}

	public BoardDTO getBoardView(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoardView", seq);
		sqlSession.close();
		return boardDTO;
	}

	public void boardModify(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardModify", map);
		sqlSession.commit();
		sqlSession.close();

	}

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		// selectOne이다 해서 무조건 dto를 불러오는 게 아니다.
		// 정수형 값으로 받는다.
		sqlSession.close();
		return totalA;
	}

	public void boardReply(Map<String, String> map) {
		// 원글
		// 위에서 getBoardView는 seq만 준다면 그 사람에 대한 모든 것을 꺼내온다
		// 원글 번호는 map이 쥐고 있다. map.put("pseq", pseq+"");
		BoardDTO pDTO = getBoardView(Integer.parseInt(map.get("pseq")));

		SqlSession sqlSession = sqlSessionFactory.openSession();

		// step(글순서) update
		// update board set step=step+1 where ref=#{원글ref} and step > #{원글step}
		sqlSession.update("boardSQL.boardReply1", pDTO);

		// insert
		map.put("ref", pDTO.getRef() + ""); // 답글ref = 원글ref
		map.put("lev", pDTO.getLev() + 1 + ""); // 답글lev = 원글lev+1
		map.put("step", pDTO.getStep() + 1 + ""); // 답글step = 원글step+1

		sqlSession.insert("boardSQL.boardReply2", map);

		// reply(답글수) update
		// update board set reply=reply+1 where seq=#{pseq}
		sqlSession.update("boardSQL.boardReply3", Integer.parseInt(map.get("pseq")));

		sqlSession.commit();
		sqlSession.close();

	}

	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();

	}
}