package com.myfeast.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyFeastDAO implements MyFeastDAO_interface
{
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String userid = "DA101G6";
    String passwd = "123456";

    private static final String INSERT_STMT = "INSERT INTO MYFEAST(MYE_FEANO, MYE_MEMNO) VALUES (?, ?)";
//  應該不需要修改
    private static final String UPDATE = "UPDATE MYFEAST set mye_feano=?, mye_memno=? where mye_feano = ? and mye_memno = ?";

    private static final String DELETE = "DELETE FROM MYFEAST where mye_feano = ? and mye_memno = ?";
    private static final String GET_ALL_STMT = "SELECT * FROM MYFEAST order by MYE_MEMNO";
    private static final String GET_ONE_STMT = "SELECT * FROM MYFEAST where mye_feano = ? and mye_memno = ?";

    @Override
    public void insert(MyFeastVO myFeastVO)
    {
        Connection con = null;
        PreparedStatement pstmt = null;

        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, myFeastVO.getMye_feaNo());
            pstmt.setString(2, myFeastVO.getMye_memNo());

            pstmt.executeUpdate();

        }
        catch (ClassNotFoundException e)
        {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
        }
        catch (SQLException se)
        {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        }
        finally
        {
            if (pstmt != null)
            {
                try
                {
                    pstmt.close();
                }
                catch (SQLException se)
                {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null)
            {
                try
                {
                    con.close();
                }
                catch (Exception e)
                {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void update(MyFeastVO myFeastVOModified, MyFeastVO myFeastVOToBeModified)
    {
        Connection con = null;
        PreparedStatement pstmt = null;

        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, myFeastVOModified.getMye_feaNo());
            pstmt.setString(2, myFeastVOModified.getMye_memNo());
            pstmt.setString(3, myFeastVOToBeModified.getMye_feaNo());
            pstmt.setString(4, myFeastVOToBeModified.getMye_memNo());

            pstmt.executeUpdate();

        }
        catch (ClassNotFoundException e)
        {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
        }
        catch (SQLException se)
        {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        }
        finally
        {
            if (pstmt != null)
            {
                try
                {
                    pstmt.close();
                }
                catch (SQLException se)
                {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null)
            {
                try
                {
                    con.close();
                }
                catch (Exception e)
                {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void delete(String mye_feaNo, String mye_memNo)
    {
        Connection con = null;
        PreparedStatement pstmt = null;

        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(DELETE);

            pstmt.setString(1, mye_feaNo);
            pstmt.setString(2, mye_memNo);

            pstmt.executeUpdate();

        }
        catch (ClassNotFoundException e)
        {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
        }
        catch (SQLException se)
        {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        }
        finally
        {
            if (pstmt != null)
            {
                try
                {
                    pstmt.close();
                }
                catch (SQLException se)
                {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null)
            {
                try
                {
                    con.close();
                }
                catch (Exception e)
                {
                    e.printStackTrace(System.err);
                }
            }
        }

    }

    @Override
    public MyFeastVO findByPrimaryKey(String mye_feaNo, String mye_memNo)
    {
        MyFeastVO myFeastVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setString(1, mye_feaNo);
            pstmt.setString(2, mye_memNo);

            rs = pstmt.executeQuery();

            while (rs.next())
            {
                myFeastVO = new MyFeastVO();
                myFeastVO.setMye_feaNo(rs.getString("mye_feaNo"));
                myFeastVO.setMye_memNo(rs.getString("mye_memNo"));
            }
        }
        catch (ClassNotFoundException e)
        {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
        }
        catch (SQLException se)
        {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        }
        finally
        {
            if (pstmt != null)
            {
                try
                {
                    pstmt.close();
                }
                catch (SQLException se)
                {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null)
            {
                try
                {
                    con.close();
                }
                catch (Exception e)
                {
                    e.printStackTrace(System.err);
                }
            }
        }
        return myFeastVO;
    }

    @Override
    public List<MyFeastVO> getAll()
    {
        List<MyFeastVO> list = new ArrayList<MyFeastVO>();
        MyFeastVO myFeastVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next())
            {
                myFeastVO = new MyFeastVO();
                myFeastVO.setMye_feaNo(rs.getString("mye_feaNo"));
                myFeastVO.setMye_memNo(rs.getString("mye_memNo"));

                list.add(myFeastVO);
            }
        }
        catch (ClassNotFoundException e)
        {
            throw new RuntimeException("Couldn't load database driver. "
                    + e.getMessage());
            // Handle any SQL errors
        }
        catch (SQLException se)
        {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        }
        finally
        {
            if (pstmt != null)
            {
                try
                {
                    pstmt.close();
                }
                catch (SQLException se)
                {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null)
            {
                try
                {
                    con.close();
                }
                catch (Exception e)
                {
                    e.printStackTrace(System.err);
                }
            }
        }
        return list;
    }

//    public static void main(String[] args)
//    {
//        MyFeastDAO dao = new MyFeastDAO();
//        // 新增
//        MyFeastVO MyFeastVO1 = new MyFeastVO();
//        MyFeastVO1.setMye_feaNo("FE000001");
//        MyFeastVO1.setMye_memNo("ME000005");
//
//        dao.insert(MyFeastVO1);
//
//        // 修改
//        MyFeastVO MyFeastVO2 = new MyFeastVO();
//        MyFeastVO MyFeastVO3 = new MyFeastVO();
//        MyFeastVO2.setMye_feaNo("FE000001");
//        MyFeastVO2.setMye_memNo("ME000003");
//        MyFeastVO3.setMye_feaNo("FE000002");
//        MyFeastVO3.setMye_memNo("ME000002");
//
//        dao.update(MyFeastVO2, MyFeastVO3);
//
//        // 刪除
//        dao.delete("FE000005", "ME000005");
//
//        // 查詢
//        MyFeastVO MyFeastVO4 = dao.findByPrimaryKey("FE000002", "ME000005");
//
//        System.out.print(MyFeastVO4.getMye_feaNo() + ",");
//        System.out.println(MyFeastVO4.getMye_memNo());
//        System.out.println("---------------------");
//        // 查詢
//
//        List<MyFeastVO> list = dao.getAll();
//        for (MyFeastVO MyFeastVO : list)
//        {
//            System.out.print(MyFeastVO.getMye_feaNo() + ",");
//            System.out.println(MyFeastVO.getMye_memNo());
//            System.out.println("---------------------");
//        }
//    }
}
