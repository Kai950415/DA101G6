package com.ord_details.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mem.modle.MemVO;

public class Ord_detailsDAO implements Ord_detailsDAO_Interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "DA101G6";
	String passwd = "123456";

	private static final String INSERT = 
			"Insert into ord_details (DET_ORDNO,DET_FONO,DET_PRICE,DET_QUANTITY) values \r\n" + 
			"?,?,?,?)";
	private static final String GET_ALL = 
		"SELECT * FROM ord_details order by DET_ORDNO";
	private static final String GET_ONE = 
		"SELECT * FROM ord_details where DET_ORDNO = ?  and DET_FONO=?";
	private static final String DELETE = 
		"DELETE FROM ord_details where DET_ORDNO = ?  and  DET_FONO=?";
	private static final String UPDATE = 
		"UPDATE ord_details set  DET_ORDNO=?,DET_FONO=?,DET_PRICE=?,DET_QUANTITY=? where DET_ORDNO = ? and  DET_FONO=?";
	//請注意:雙主鍵取單筆要兩個索引值

	@Override
	public void insert(Ord_detailsVO ord_detailsVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1,ord_detailsVO.getDet_ordno());
			pstmt.setString(2,ord_detailsVO.getDet_fono());
			pstmt.setInt(3,ord_detailsVO.getDet_price());
			pstmt.setInt(4,ord_detailsVO.getDet_quantity());
			
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
	public void update(Ord_detailsVO ord_detailsVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1,ord_detailsVO.getDet_ordno());//可以拿掉
			pstmt.setString(2,ord_detailsVO.getDet_fono());//可以拿掉
			
			pstmt.setInt(3,ord_detailsVO.getDet_price());
			pstmt.setInt(4,ord_detailsVO.getDet_quantity());
			pstmt.setString(5,ord_detailsVO.getDet_ordno());
			pstmt.setString(6,ord_detailsVO.getDet_fono());
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
	public void delete(String det_ordno,String det_fono) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, det_ordno);
			pstmt.setString(2, det_fono);

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
	public Ord_detailsVO findByPrimaryKey(String det_ordno,String det_fono) {
		// TODO Auto-generated method stub
		Ord_detailsVO ord_detailsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setString(1, det_ordno);
			pstmt.setString(2, det_fono);
			rs = pstmt.executeQuery();
			

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				ord_detailsVO.setDet_ordno(rs.getString("det_ordno"));
				ord_detailsVO.setDet_fono(rs.getString("det_fono"));
				ord_detailsVO.setDet_price(rs.getInt("det_price"));
				ord_detailsVO.setDet_quantity(rs.getInt("det_quantity"));
				
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
		return ord_detailsVO;
	}

	@Override
	public List<Ord_detailsVO> getAll() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		List<Ord_detailsVO> list = new ArrayList<Ord_detailsVO>();
		Ord_detailsVO ord_detailsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				ord_detailsVO.setDet_ordno(rs.getString("det_ordno"));
				ord_detailsVO.setDet_fono(rs.getString("det_fono"));
				ord_detailsVO.setDet_price(rs.getInt("det_price"));
				ord_detailsVO.setDet_quantity(rs.getInt("det_quantity"));
				
				list.add(ord_detailsVO); // Store the row in the list
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

}
