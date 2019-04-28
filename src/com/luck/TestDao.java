package com.luck;

import java.io.IOException;

/**
 * Created by luckguozi on 2019/4/8.
 */
public class TestDao {
     public static void main(String[] args) {
        HbaseDao mm = new HbaseDao();
        String h ="8";
        //String s =null;
        try{
           String s = mm.getDataByRowKey(h);
            System.out.println(s);
        }catch(IOException e){
            e.printStackTrace();
        }


    }

}
