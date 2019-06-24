package com.tools;

//33行貼上你的金鑰
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DecimalFormat;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GetResterauntFromGoogleForTeam
{
    static String driver = "oracle.jdbc.driver.OracleDriver";
    static String url = "jdbc:oracle:thin:@localhost:1521:XE";
    static String userid = "DA101G6";
    static String passwd = "123456";

    final static String INSERT_STMT = "Insert into RESTAURANT (RES_NO,RES_ADRS,RES_NAME,RES_PH,RES_POINT,RES_AC,RES_PASS,RES_IMG,RES_INTRO,RES_HOURS,RES_LAT,RES_LOT,RES_SCORE,RES_COST,RES_COMCOUNT,RES_TYPE,RES_STATUS)"
            + "values ('RS'||LPAD(to_char(res_seq.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    static DecimalFormat geoFormat = new DecimalFormat("###.#######");

    // 貼上你的金鑰
    static String yourKey = "";
    static String NEXT_PAGE_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
            + "&language=zh-TW&key=" + yourKey + "&pagetoken=";

    static int Counter = 0;

    static Connection con = null;
    static PreparedStatement pstmt = null;

    public static void crawlInformation(String MY_URL)
            throws IOException, JSONException, InterruptedException, ClassNotFoundException, SQLException
    {
        Class.forName(driver);
        con = DriverManager.getConnection(url, userid, passwd);
        pstmt = con.prepareStatement(INSERT_STMT);

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

        System.out.println(sb.toString());

        if (jObj.has("results"))
        {
            JSONArray results = jObj.getJSONArray("results");

            for (int i = 0; i < results.length(); i++)
            {
                Counter++;
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

                String account = "AC" + (int) (Math.random() * 899999 + 100000);
                pstmt.setString(5, account);
                System.out.println("帳號:" + account);

                String pass = "123456";
                pstmt.setString(6, pass);
                System.out.println("密碼" + pass);

                byte[] pic = null;
                pstmt.setBytes(7, pic);

                String intro = "你好，我們餐廳很好吃。";
                pstmt.setString(8, intro);

                String[] minuteArr = {"00", "30"};
                String busiHour = (int) Math.floor((Math.random() * 4 + 7)) + ":"
                        + minuteArr[(int) Math.round(Math.random())]
                        + "~" + (int) Math.floor((Math.random() * 7 + 15)) + ":"
                        + minuteArr[(int) Math.round(Math.random())];
                pstmt.setString(9, busiHour);
                System.out.println("營業時間:" + busiHour);

                if (data.has("geometry"))
                {
                    JSONObject geometry = data.getJSONObject("geometry");
                    JSONObject location = geometry.getJSONObject("location");
                    Double lat = location.getDouble("lat");
                    Double lng = location.getDouble("lng");

                    pstmt.setDouble(10, lat);
                    System.out.println("餐廳的緯度: " + lat);

                    pstmt.setDouble(11, lng);
                    System.out.println("餐廳的經度: " + lng);
                }
                if (data.has("user_ratings_total"))
                {
                    int user_ratings_total = data.getInt("user_ratings_total");

                    pstmt.setInt(14, user_ratings_total);
                    System.out.println("餐廳評分人數" + user_ratings_total);

                    if (data.has("rating"))
                    {
                        Double rating = data.getDouble("rating");

                        pstmt.setDouble(12, (int) (rating * user_ratings_total));
                        System.out.println("餐廳的總分: " + (int) (rating * user_ratings_total));

                    }
                }
                int priceLevel = (int) Math.floor(Math.random() * 5);
                if (data.has("price_level"))
                {
                    priceLevel = data.getInt("price_level");
                }
                pstmt.setInt(13, priceLevel);
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

                    pstmt.setString(15, type);
                    System.out.println("餐廳類型" + type);
                }

                String[] statusArr = {"res1", "res2", "res3", "res4"};

                pstmt.setString(16, statusArr[(int) Math.floor(Math.random() * 4)]);
                System.out.println("狀態" + statusArr[(int) Math.floor(Math.random() * 4)]);

                System.out.println("============================");
                pstmt.executeUpdate();
            }
        }
        Thread.sleep(3000);
        
        if (jObj.has("next_page_token"))
        {
            String next_page_token = jObj.getString("next_page_token");
            crawlInformation(NEXT_PAGE_URL + next_page_token);
        }
        else
        {
            System.out.println("end");
            con.disconnect();
        }
    }

    public static void main(String[] args) throws InterruptedException
    {
        try
        {
            for (int i = 0; i < 18; i++)
            {
                String[] latLotArr = {"25.0579836,121.5507254", "25.0515171,121.5282781", "25.070558,121.5151448",
                        "25.0436241,121.5736891", "25.0273317,121.5013151", "24.9563445,121.2202532",
                        "24.993887,121.311322", "24.8116359,120.9682452", "25.1293639,121.7398246",
                        "24.7572623,121.7507216", "23.9923904,121.5798518", "22.7580544,121.1373922",
                        "22.642986,120.2957869", "22.6756046,120.3070765", "22.8542116,120.2457527",
                        "22.9977522,120.201296", "23.0634529,120.2644737", "24.1428017,120.6345498",
                };
                for (int j = 0; j < 3; j++)
                {
                    String[] typeArr = {"cafe", "bar", "food"};
                    String GOOGLE_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
                            + "location=" + latLotArr[i]
                            + "&radius=5000&types=" + typeArr[j] + "&hasNextPage=true&"
                            + "nextPage()=true&language=zh-TW&key=" + yourKey;

                    crawlInformation(GOOGLE_URL);
                }
            }
            System.out.println(Counter + "個資料");
        }
        catch (JSONException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        catch (InterruptedException e)
        {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

}
