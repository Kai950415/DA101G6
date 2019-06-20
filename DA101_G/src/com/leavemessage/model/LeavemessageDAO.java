package com.leavemessage.model;

import java.sql.*;
import java.util.*;


public class LeavemessageDAO implements LeavemessageDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "DA101G6";
	String passwd = "123456";
	
	private static final String INSERT_STMT		= 
			"INSERT INTO leaveMessage (lm_no, lm_postno, lm_memno, lm_text, lm_status) VALUES (leaveMessage_seq,?,?,?,?)";
	private static final String GET_ALL_STMT	=
			"SELECT lm_no, lm_postno, lm_memno, lm_text, lm_status FROM leaveMessage order by lm_no";
	private static final String GET_ONE_STMT	=
			"SELECT lm_no, lm_postno, lm_memno, lm_text, lm_status FROM leaveMessage where lm_no = ?";
	private static final String DELETE			=
			"DELETE FROM leaveMessage where lm_no = ?";
	private static final String UPDATE			=
			"UPDATE leaveMessage set lm_postno=?, lm_memno=?, lm_text=?, lm_status=? where lm_no = ?";
	

	@Override
	public void insert(LeavemessageVO LeavemessageVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, LeavemessageVO.getLm_no());
			pstmt.setString(2, LeavemessageVO.getLm_postno());
			pstmt.setString(3, LeavemessageVO.getLm_memno());
			pstmt.setString(4, LeavemessageVO.getLm_text());
			pstmt.setString(5, LeavemessageVO.getLm_status());
			
			
//			

			pstmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("沒有連上DB"+e.getMessage());
		}catch(SQLException se) {
			throw new RuntimeException("錯誤發生!"+ se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
	}

	@Override
	public void update(LeavemessageVO LeavemessageVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, LeavemessageVO.getLm_no());
			pstmt.setString(2, LeavemessageVO.getLm_postno());
			pstmt.setString(3, LeavemessageVO.getLm_memno());
			pstmt.setString(4, LeavemessageVO.getLm_text());
			pstmt.setString(5, LeavemessageVO.getLm_status());
			

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(String lmNo) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1,lmNo);
		
			

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public LeavemessageVO findByPrimaryKey(String lmNo) {

		LeavemessageVO LeavemessageVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, lmNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				LeavemessageVO = new LeavemessageVO();
				LeavemessageVO.setLm_no(rs.getString("lm_no"));
				LeavemessageVO.setLm_postno(rs.getString("lm_postno"));
				LeavemessageVO.setLm_memno(rs.getString("lm_memno"));
				LeavemessageVO.setLm_text(rs.getString("lm_text"));
				LeavemessageVO.setLm_status(rs.getString("lm_status"));

			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return LeavemessageVO;
	}

	@Override
	public List<LeavemessageVO> getAll() {
		List<LeavemessageVO> list = new ArrayList<LeavemessageVO>();
		LeavemessageVO LeavemessageVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				LeavemessageVO = new LeavemessageVO();
				LeavemessageVO.setLm_no(rs.getString("lm_no"));
				LeavemessageVO.setLm_postno(rs.getString("lm_postno"));
				LeavemessageVO.setLm_memno(rs.getString("lm_memno"));
				LeavemessageVO.setLm_text(rs.getString("lm_text"));
				LeavemessageVO.setLm_status(rs.getString("lm_status"));
				list.add(LeavemessageVO);
				// Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {

		LeavemessageDAO dao = new LeavemessageDAO();

		// 新增
		LeavemessageVO LeaveVO1 = new LeavemessageVO();
		LeaveVO1.setLm_no("LM000006");
		LeaveVO1.setLm_postno("P000006");
		LeaveVO1.setLm_memno("ME000006");
		LeaveVO1.setLm_text("今天去吃了王品牛排,好吃好吃!");
		LeaveVO1.setLm_status("lm1");
		dao.insert(LeaveVO1);

		// 修改
		LeavemessageVO LeaveVO2 = new LeavemessageVO();
		LeaveVO2.setLm_no("LM000005");
		LeaveVO2.setLm_postno("P000005");
		LeaveVO2.setLm_memno("ME000005");
		LeaveVO2.setLm_text("你已經被我修改了!");
		LeaveVO2.setLm_status("lm2");
		
		dao.update(LeaveVO2);

		// 刪除
		dao.delete("LM000004");

		// 查詢
		LeavemessageVO LeaveVO3 = dao.findByPrimaryKey("LM000001");
		System.out.print(LeaveVO3.getLm_no() + ",");
		System.out.print(LeaveVO3.getLm_postno() + ",");
		System.out.print(LeaveVO3.getLm_memno() + ",");
		System.out.print(LeaveVO3.getLm_text() + ",");
		System.out.print(LeaveVO3.getLm_status() + ",");
		
		System.out.println("---------------------");

		// 查詢
		List<LeavemessageVO> list = dao.getAll();
		for (LeavemessageVO aEmp : list) {
			System.out.print(aEmp.getLm_no() + ",");
			System.out.print(aEmp.getLm_postno() + ",");
			System.out.print(aEmp.getLm_memno() + ",");
			System.out.print(aEmp.getLm_text() + ",");
			System.out.print(aEmp.getLm_status() + ",");
			System.out.println();
		}
	}
}
