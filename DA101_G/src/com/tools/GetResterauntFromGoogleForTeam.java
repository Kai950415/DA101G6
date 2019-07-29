package com.tools;

//30貼上你的金鑰
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GetResterauntFromGoogleForTeam
{
    static String driver = "oracle.jdbc.driver.OracleDriver";
    static String url = "jdbc:oracle:thin:@localhost:1521:XE";
    static String userid = "DA101G6";
    static String passwd = "123456";

    final static String INSERT_STMT = "Insert into RESTAURANT (RES_NO, RES_ADRS, RES_NAME, RES_PH, RES_POINT, "
            + "RES_AC, RES_PASS, RES_IMG, RES_INTRO, RES_START, "
            + "RES_END, RES_LAT, RES_LOT, RES_SCORE, RES_COST, "
            + "RES_COMCOUNT, RES_TYPE, RES_STATUS) "
            + "values ('RS'||LPAD(to_char(res_seq.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // 貼上你的金鑰
    static String yourKey = "";
    static String NEXT_PAGE_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
            + "&language=zh-TW&key=" + yourKey + "&pagetoken=";

    static int successCounter = 0;
    static int failCounter = 0;

    static Connection con = null;
    static PreparedStatement pstmt = null;

    public static void printInformation(String MY_URL) throws IOException, ClassNotFoundException, InterruptedException
    {
        Class.forName(driver);
        try
        {
            con = DriverManager.getConnection(url, userid, passwd);
            pstmt = con.prepareStatement(INSERT_STMT);
        }
        catch (SQLException e1)
        {
            e1.printStackTrace();
        }

        StringBuilder sb = new StringBuilder();
        URL url = new URL(MY_URL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setUseCaches(false);
        InputStream is = con.getInputStream();
        InputStreamReader isr = new InputStreamReader(is);
        BufferedReader br = new BufferedReader(isr);
        String str;
        while ((str = br.readLine()) != null)
            sb.append(str);

        br.close();
        isr.close();
        is.close();
        con.disconnect();

        System.out.println("===================================");

        JSONObject jObj = new JSONObject(sb.toString());
        Integer accountCount = 500;
        
        if (jObj.has("results"))
        {
            JSONArray results = jObj.getJSONArray("results");

            for (int i = 0; i < results.length(); i++)
            {
                try
                {
                    successCounter++;
                    JSONObject data = results.getJSONObject(i);

                    if (data.has("vicinity"))
                    {
                        String vicinity = data.getString("vicinity");

                        pstmt.setString(1, vicinity);
                        System.out.println("餐廳的地址: " + vicinity);
                    }

                    if (data.has("name"))
                    {
                        String name = data.getString("name");

                        pstmt.setString(2, name);
                        System.out.println("餐廳名稱 : " + name);
                    }

                    String phoneNum = "03-1234567";
                    pstmt.setString(3, phoneNum);
                    System.out.println("電話:" + phoneNum);

                    int point = (int) (Math.random() * 100000);
                    pstmt.setInt(4, point);
                    System.out.println("點數" + point);

                    accountCount++;
                    String account = "AC" + (int) (accountCount + 100000);
                    pstmt.setString(5, account);
                    System.out.println("帳號:" + account);

                    String pass = "123456";
                    pstmt.setString(6, pass);
                    System.out.println("密碼" + pass);

                    if (data.has("photos"))
                    {
                        JSONArray photoArray = data.getJSONArray("photos");
                        JSONObject photo = photoArray.getJSONObject(0);
                        int height = photo.getInt("height");
                        int width = photo.getInt("width");
                        String photo_reference = photo.getString("photo_reference");

                        byte[] pic = getPicture(height, width, photo_reference);

                        pstmt.setBytes(7, pic);
                        System.out.println(pic);
                    }
                    else
                    {
                        byte[] pic = null;
                        pstmt.setBytes(7, pic);
                    }

                    String intro = "你好，我們餐廳很好吃。";
                    pstmt.setString(8, intro);

                    String[] minuteArr = {"00", "30"};
                    String startHour = (int) Math.floor((Math.random() * 4 + 7)) + ":"
                            + minuteArr[(int) Math.round(Math.random())];

                    String endHours = (int) Math.floor((Math.random() * 7 + 15)) + ":"
                            + minuteArr[(int) Math.round(Math.random())];

                    pstmt.setString(9, startHour);
                    System.out.println("營業開始時間:" + startHour);

                    pstmt.setString(10, endHours);
                    System.out.println("營業結束時間:" + endHours);

                    if (data.has("geometry"))
                    {
                        JSONObject geometry = data.getJSONObject("geometry");
                        JSONObject location = geometry.getJSONObject("location");
                        Double lat = location.getDouble("lat");
                        Double lng = location.getDouble("lng");

                        pstmt.setDouble(11, lat);
                        System.out.println("餐廳的緯度: " + lat);

                        pstmt.setDouble(12, lng);
                        System.out.println("餐廳的經度: " + lng);
                    }
                    if (data.has("user_ratings_total"))
                    {
                        int user_ratings_total = data.getInt("user_ratings_total");

                        pstmt.setInt(15, user_ratings_total);
                        System.out.println("餐廳評分人數" + user_ratings_total);

                        if (data.has("rating"))
                        {
                            Double rating = data.getDouble("rating");

                            pstmt.setInt(13, (int) (rating * user_ratings_total));
                            System.out.println("餐廳的總分: " + (int) (rating * user_ratings_total));

                        }
                    }
                    else
                    {
                        int user_ratings_total = (int) Math.random() * 1000;

                        pstmt.setInt(15, user_ratings_total);
                        System.out.println("餐廳評分人數" + user_ratings_total);

                        if (data.has("rating"))
                        {
                            Double rating = (double) Math.round(Math.random() * 50) / 10.f;

                            pstmt.setDouble(13, (int) (rating * user_ratings_total));
                            System.out.println("餐廳的總分: " + (int) (rating * user_ratings_total));

                        }
                    }
                    int priceLevel = (int) Math.floor(Math.random() * 5);
                    if (data.has("price_level"))
                    {
                        priceLevel = data.getInt("price_level");
                    }
                    pstmt.setInt(14, priceLevel);
                    System.out.println("消費區間:" + priceLevel);

//                if (data.has("opening_hours"))
//                {
//                    JSONObject opening_hours = data.getJSONObject("opening_hours");
//                    boolean open_now = opening_hours.getBoolean("open_now");
//
//                    if (open_now)
//                    {
//                        System.out.println("餐廳是否營業中:是");
//                    }
//                    else
//                    {
//                        System.out.println("餐廳是否營業中:否");
//                    }
//                }

                    if (data.has("types"))
                    {
                        JSONArray typeArr = data.getJSONArray("types");
                        String type = typeArr.getString(0);

                        pstmt.setString(16, type);
                        System.out.println("餐廳類型" + type);
                    }
                    else
                    {
                        String type = "restaurant";

                        pstmt.setString(16, type);
                        System.out.println("餐廳類型" + type);
                    }


                    pstmt.setString(17, "res3");
                    System.out.println("狀態" + "res3");

                    System.out.println("============================");
                    pstmt.executeUpdate();
                }
                catch (JSONException e)
                {
                    e.printStackTrace();
//                  System.err.println("JSON出錯了");
                    successCounter--;
                    failCounter++;
                    continue;
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
//                  System.err.println("SQL新增餐廳出錯了");
                    successCounter--;
                    failCounter++;
                    continue;
                }
            }
        }
        Thread.sleep(1500);

        if (jObj.has("next_page_token"))
        {
            String next_page_token = jObj.getString("next_page_token");
            printInformation(NEXT_PAGE_URL + next_page_token);
        }
        else
        {
            System.out.println("end");
        }
    }

    public static byte[] getPicture(int height, int width, String photo_reference) throws IOException
    {
        String photoUrl = "https://maps.googleapis.com/maps/api/place/photo?maxheight=" + height + "&maxwidth=" + width
                + "&photoreference=" + photo_reference + "&key=" + yourKey;

        URL url = new URL(photoUrl);
        InputStream is = url.openStream();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        
        byte[] byteChunk = new byte[4096];
        
        int n;

        while ( (n = is.read(byteChunk)) > 0 ) 
        {
          baos.write(byteChunk, 0, n);
        }
        
        
        byte[] pic = baos.toByteArray();

        return pic;
    }

    public static void main(String[] args)
    {

        try
        {
            for (int i = 0; i < 10; i++)
            {
                String[] latLotArr = 
                {
                        "24.9553126,121.2408517", "24.9591649,121.2145252", "24.9951981,121.310467", "25.0169256,121.2967061",//桃園
                        "25.0545357,121.5200368", "25.0537079,121.5371448", "25.0390062,121.5539839",//台北
                        "24.1483582,120.6695738",//台中
                        "22.9915034,120.2010151",//台南
                        "22.6188955,120.3024494",//高雄
                };

                    String GOOGLE_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
                            + "location=" + latLotArr[i]
                            + "&radius=500&types=" + "restaurant" + "&hasNextPage=true&"
                            + "nextPage()=true&language=zh-TW&key=" + yourKey;

                    printInformation(GOOGLE_URL);

            }
            System.out.println("成功新增" + successCounter + "個資料");
            System.out.println("新增" + failCounter + "個資料失敗");

        }
        catch (ClassNotFoundException | IOException | InterruptedException e)
        {
            e.printStackTrace();
        }

    }

}
