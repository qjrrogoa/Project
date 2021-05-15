package model.pdm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;


public class BBSDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
	public BBSDAO(ServletContext context) {
		try {
			//데이타 베이스 연결하기-커넥션 풀 이용]
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/myjsp");
			conn=source.getConnection();
			}
		catch(NamingException | SQLException e) {e.printStackTrace();}
	}////////////////
	//자원반납용]-사용한 커넥션 객체를 다시 풀에 반납
	public void close() {
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			//커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
			if(conn !=null) conn.close();
		}
		catch(SQLException e) {e.printStackTrace();}
	}///////////close
	
	public int Membership(MemberDTO dto) {
		int affected=0;
		String sql ="insert into member values(?,?,?,?,?,?,?,DEFAULT)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getgender());
			psmt.setString(5, dto.getInter());
			psmt.setString(6, dto.getGrade());
			psmt.setString(7, dto.getIntro());
			affected = psmt.executeUpdate();
		}
		catch(SQLException e ) {
			e.printStackTrace();
		}
		return affected;
	}
	public boolean IsMember(String id, String password) {
		String sql="select count(*) from member where id=? and password=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) 
				return false;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean Check(String id) {
		String sql = "select count(*) from member where id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) 
				return false;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public int insert(BBSDTO dto) {
			int affected=0;
			String sql="INSERT INTO bbs VALUES(SEQ_BBS.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT)";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getContent());
				psmt.setString(4, dto.getTrip());
				psmt.setString(5, dto.getAttachfile());
				affected = psmt.executeUpdate();
			}
			catch(SQLException e) {e.printStackTrace();}
			return affected;
	}
	
	public int getTotalRecordCount() {
		int totalCount=0;
		String sql="SELECT COUNT(*) FROM bbs";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);		
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}/////////getTotalRecordCount
	
	
	public List<BBSDTO> selectList(Map map) {
		List<BBSDTO> list = new Vector<BBSDTO>();
		//페이징 적용 쿼리(구간 쿼리)
		String sql = "SELECT * FROM (Select T.*,ROWNUM R FROM(SELECT * FROM bbs ORDER BY no DESC) T) WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			//시작 및 끝 행번호 설정]
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				BBSDTO dto = new BBSDTO();
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTrip(rs.getString(5));
				dto.setAttachfile(rs.getString(6));
				dto.setVisitcount(rs.getString(7));
				dto.setPostdate(rs.getDate(8));
				list.add(dto);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}/////////////selectList
	public BBSDTO SelectOne(String no, String prevPage) {
		BBSDTO dto=null;
		try {
			conn.setAutoCommit(false);
			String sql;
			//목록에서 넘어온 경우에만 조회수 증가
			if(prevPage.toUpperCase().indexOf("LIST.KOSMO") !=-1){
				//조회 수 업데이트
				sql="UPDATE bbs SET visitcount = visitcount+1 WHERE no=?";
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, no);
				psmt.executeUpdate();
			}
			sql = "SELECT * from bbs WHERE no=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto = new BBSDTO();
				dto.setNo(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setTrip(rs.getString(5));
				dto.setAttachfile(rs.getString(6));
				dto.setVisitcount(rs.getString(7));
				dto.setPostdate(rs.getDate(8));
				}
			conn.commit();
			}
		catch(SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} 
			catch (SQLException e1) {e1.printStackTrace();}
		}
		return dto;
	}
	
	public boolean isCorrectPassword(String no, String password) {
		String sql="select password,no from bbs b Join member m on b.id=m.id where no = ?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs=psmt.executeQuery();
			if(rs.next()) {
				if(!rs.getString(1).equals(password))
					return false;
			}
		}/////try
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}////catch
		return true;
	}//////isCorrectPassword
	//삭제용]
	public int delete(String no) {
		int affected=0;
		String sql ="delete bbs where no=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected=psmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}
	public int update(BBSDTO dto) {
		int affected=0;
		String sql="UPDATE bbs SET title =?, attachfile=?, content=?, trip=? WHERE no=? ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getAttachfile());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getTrip());
			psmt.setString(5, dto.getNo());
			
			affected = psmt.executeUpdate();
			
		}
		catch(SQLException e) {e.printStackTrace();}
		return affected;
	}
	public int MemberEdit(MemberDTO dto) {
		String sql="update member set password=?, name=?, gender=?, inter=?, grade=?, intro=? where id=?";
		int affected=0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPassword());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getgender());
			psmt.setString(4, dto.getInter());
			psmt.setString(5, dto.getGrade());
			psmt.setString(6, dto.getIntro());
			psmt.setString(7, dto.getId());
			affected=psmt.executeUpdate();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
	public MemberDTO Mypage(String id) {
		String sql = "select * FROM member where id=?";
		MemberDTO dto=null;
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
			dto = new MemberDTO();
			dto.setId(rs.getString(1));
			dto.setName(rs.getString(3));
			dto.setgender(rs.getString(4));
			dto.setInter(rs.getString(5));
			dto.setGrade(rs.getString(6));
			dto.setIntro(rs.getString(7));
			dto.setRegidate(rs.getDate(8));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
