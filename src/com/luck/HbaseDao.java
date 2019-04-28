package com.luck;


import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.security.User;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Scan;
import com.luck.Food;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by luckguozi on 2019/4/8.
 */
public class HbaseDao {
    /**
     * @description 登录验证使用
     * @param rowKey
     */
    public String getDataByRowKey(String rowKey) throws IOException {

        HTable table = Hbase.getInstance().getTable("user");
        Get get = new Get(rowKey.getBytes());
        String resu = null;
        //User user = new User();
        //user.setId(rowKey);
        //先判断是否有此条数据,根本无法判断。。。。
        if (!get.isCheckExistenceOnly()) {
            get.addColumn(Bytes.toBytes("info"),Bytes.toBytes("pwd"));
            Result res = table.get(get);
            byte[] resByte = res.getValue(Bytes.toBytes("info"), Bytes.toBytes("pwd"));
            resu = Bytes.toString(resByte);
        }
        return resu;

    }
    //查询给用户推荐的餐饮编号
    public String getFoodRec(String rowKey)throws IOException{
        HTable table = Hbase.getInstance().getTable("user");
        Get get = new Get(rowKey.getBytes());
        String resu = null;
        if (!get.isCheckExistenceOnly()) {
            get.addColumn(Bytes.toBytes("info"),Bytes.toBytes("recFoods"));
            Result res = table.get(get);
            byte[] resByte = res.getValue(Bytes.toBytes("info"), Bytes.toBytes("recFoods"));
            resu = Bytes.toString(resByte);
        }
        return resu;
    }
    //查询食物信息
    public Food getFoodData(String rowKey)throws IOException{
        HTable table = Hbase.getInstance().getTable("food");
        Get get = new Get(rowKey.getBytes());
        Food f = new Food();
        if (!get.isCheckExistenceOnly()) {
            get.addFamily(Bytes.toBytes("info"));
            Result res = table.get(get);

            String data[] = new String[4];
            int i=0;
            for(KeyValue kv:res.raw()){//row 方法过时，可以有更好的选择  cellrow是替代的选择，具体可以看下面的方法


                data[i]=Bytes.toString(kv.getValue());
                //System.out.println(data[i]);
                i++;
            }
            f.setFid(data[0]);
            f.setName(data[1]);
            f.setUrl(data[2]);

        }
        return f;

    }
    //主要用来显示所有的菜名
    public  List<Food> getAllName(int i) throws IOException {
        List<Get> getList = new ArrayList();
        List<Food>list=new ArrayList();
        List<String>rowkeyList=new ArrayList();
        HTable table = Hbase.getInstance().getTable("food");
        for(int j=i;j<i+36&&j<896;j++){
            rowkeyList.add(String.valueOf(j));
        }
        for (String rowkey : rowkeyList){//把rowkey加到get里，再把get装到list中
            Get get = new Get(Bytes.toBytes(rowkey));
            get.addFamily(Bytes.toBytes("info"));
            getList.add(get);
        }
        Result[] results = table.get(getList);//重点在这，直接查getList<Get>
        for (Result result : results){//对返回的结果集进行操作
            Food food=new Food();
            String data[] = new String[4];
            int m=0;
            for (Cell kv : result.rawCells()) {
                data[m]= Bytes.toString(CellUtil.cloneValue(kv));
                m++;
            }
            food.setFid(data[0]);
            food.setName(data[1]);
            list.add(food);

        }
        return list;
    }

    public String getrate(String rowkey)throws IOException{
        HTable table = Hbase.getInstance().getTable("rating");
        Get get = new Get(rowkey.getBytes());
        String resu =null;
        if (!get.isCheckExistenceOnly()) {
            get.addColumn(Bytes.toBytes("info"),Bytes.toBytes("rating"));
            Result res = table.get(get);
            byte[] resByte = res.getValue(Bytes.toBytes("info"), Bytes.toBytes("rating"));
            resu = Bytes.toString(resByte);
        }
        return  resu;
    }
    public Integer regdata(String id,String pwd)throws  IOException{
        HTable table = Hbase.getInstance().getTable("user");
        Get get = new Get(id.getBytes());
        Result res =table.get(get);
        int m=1;
        System.out.println(res);
        if (res.isEmpty()) {
            Hbase.getInstance().put("user",id,"info","uid",id);
            Hbase.getInstance().put("user",id,"info","pwd",pwd);
        }else {
            m=0;
        }
        return m;
    }

}
